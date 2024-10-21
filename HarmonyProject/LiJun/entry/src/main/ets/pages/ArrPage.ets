@Entry
@Component


struct ArrPage {
people:string[]=['胡桃','甘雨','冷鸟','剑来雨']

  build() {
  Column(){
   //  需要注意的地方，ForEach的参数key是一个字符串
   ForEach(this.people,(item:string)=>{
     Text(item)
       .fontColor(item.includes('雨')?'#f00':'000')
   },(item:string)=>item)

    //渲染控制 还可以使用if else语句进行控制
    if (false){
      Button('我是一个按钮')
    }else{
      Button('我不是一个按钮')
    }
    //但是无法使用switch case语句

    Button('保存')
      // .visibility(Visibility.Hidden) //visibility控制显示/隐藏，但是依然会占用位置
      .visibility(Visibility.Visible)
  }
  .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor('#990033')
  }

}