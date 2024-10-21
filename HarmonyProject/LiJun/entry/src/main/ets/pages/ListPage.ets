interface Ulist{
  id:string;
  name:string;
  img:string;
}

// []这个数据的数据类型是由Ulist这个对象组成的数字
const listData:Ulist[]=[{
  id:'1001',
  name:'黑塔',
  img:'https://img0.baidu.com/it/u=87766000,1151851566&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889'
},
  {
    id:'1002',
    name:'花火',
    img:'https://img0.baidu.com/it/u=87766000,1151851566&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889'
  },
  {
    id:'1003',
    name:'黑天鹅',
    img:'https://img0.baidu.com/it/u=87766000,1151851566&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889'
  },
  {
    id:'1004',
    name:'毁灭大君',
    img:'https://img0.baidu.com/it/u=87766000,1151851566&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889'
  }]

@Entry
@Component
struct ListPage {


  build() {
Column(){
  Text('原此行，终抵群星')
  // List是一个列表组件
  List({
    space:16 //上下的间距
  }){
    // 每一项需要使用ListItem进行包括
    // 接收三个参数 1.数据 2.函数，生成每一项的展示内容 3.生成key的函数，每一个key一定唯一
    ForEach(listData,(item:Ulist)=>{
      ListItem(){
        Column(){
          Image(item.img)
          Text(item.name)
        }
        .padding(2)
        .border({
          width:{
            bottom:1
          },
          color:'#996699'
        })
        .margin(2)
      }
    },(item:Ulist)=>item.id)
  }
  .lanes(1) //每一行排放的数量
  .height('100%')
  .width('100%')
  .alignListItem(ListItemAlign.Center)
}

  }
}