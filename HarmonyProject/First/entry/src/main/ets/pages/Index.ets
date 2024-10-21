import { GoodsList,IGoods } from '../model/goods'

interface Person{
  name?:string, //问号表示可选参数
  desc?:string
}

@Entry
@Component
struct Index {
  // State装饰器，数据改变之后，页面更新
  @State message: string = 'Hello World';
  @State people:string[]=['杨戬','二郎神','诸葛孔明']
  @State person:Person={}

  build() {
    Column(
      {
        space:12
      }
    ){
      List(){
      ForEach(GoodsList,(item:IGoods)=>{
        ListItem(){
          Column(){
            Image(item.cover_url)
              .width('100%')
              .height('100')
            Text(item.name)
              .maxLines(2) //文字2行显示
              .ellipsisMode(EllipsisMode.END) //设置省略文字的位置
              .textOverflow({
                overflow:TextOverflow.Ellipsis //多出来的文字变成省略号
              })
            Text("￥"+item.price.toString())
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
              .fontColor('#f00')
          }
        }
      },(item:IGoods)=>item.goods_id)
      }.lanes(2) //一行2个
      .onReachEnd(()=>{
        //页面触底之后执行
      })

      Text(this.message)
      Row(){
        TextInput(
          {
            placeholder:'请输入内容',
            text:this.message //2.设置输入框的内容，这个时候是空了
          }
        )
          .alignSelf(ItemAlign.Start)
            //输入内容改变事件
          .onChange((index)=>{
            this.message=index //改变值
          })
          .width('80%')
        Button('保存')
          .width('20%')
          .onClick(()=>{
            this.people.push(this.message)
            this.message='' //1.置空，但是不会立刻刷新页面
          })
      }
      List(){
        ForEach(this.people,(item:string,index:number)=>{ //item是内容，index是索引
          ListItem(){
            ColumnSplit(){
              Text(item)
              Button('删除')
                .onClick(()=>{
                  this.people.splice(index,1)
                })
            }
          }
        },(item:string)=>item)
      }
    }
    .height('100%')
    .width('100%')
  }
}