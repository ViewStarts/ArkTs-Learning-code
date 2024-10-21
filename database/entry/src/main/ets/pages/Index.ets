import { router } from '@kit.ArkUI';
import { RODTools } from '../utils/db';

interface Person {
  id?: number;
  trueName?: string;
  nickName?: string;
  summary?: string;
  cateName?: string;
  gender?:string;
}

@Entry
@Component
struct Index {
  @State people:Person[]=[]

  aboutToAppear(): void {
    setTimeout(() => {
      // querySql,执行sql语句，查询数据
      RODTools.getInstance().querySql('这里放查询的sql语句')
        .then(res => {
          console.log('查询数据成功')
          // goToNextRow去读取下一行，如果数据读取完了，那么就不再执行
          while (res.goToNextRow()) {
            let person:Person={}
            person.id=res.getLong(res.getColumnIndex('id'))
            person.trueName=res.getString(res.getColumnIndex('true_name')) //getColumnIndex 根据列名获取列的索引
            person.nickName=res.getString(res.getColumnIndex('nick_name')) //昵称
            person.summary=res.getString(res.getColumnIndex('summary')) //履历
            person.gender=res.getString(res.getColumnIndex('gender')) //性别
            person.cateName=res.getString(res.getColumnIndex('c_name')) //属性

            this.people.push(person)
          }
        })
    })
  }

  build() {
    Column() {
      Button('X')
        .type(ButtonType.Circle)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/NewPage'
          })
        })
        .zIndex(9)
        .position({
          top: 12,
          right: 12
        })
      List({
        space: 4
      }) {
        ForEach(this.people,(item:Person)=>{
          ListItem() {
            Column({
              space: 2
            }) {
              Text('姓名:'+item.trueName)
              Text('性别:'+item.gender)
              Text('属性:'+item.cateName)
              Text('履历:'+item.summary)
            }
            .backgroundColor('#eee')
            .padding(12)
            .width('100%')
          }
        },(item:Person)=>item.id+'')
      }
    }
    .height('100%')
    .width('100%')
  }
}