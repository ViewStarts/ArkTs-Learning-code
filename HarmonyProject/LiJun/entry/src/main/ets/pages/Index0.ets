@Entry //入口
@Component //表示这个是组件
struct Index {
  @State message: string = 'Hello World';  //设置了一个响应式的数据

  //每一个组件都需要具有一个build函数，这个函数放布局
  build() {
    //每一个build函数只能有一个最外层的组件
    //表示竖排
    Column({
      space:16 //行间距
    }){
      Text('这是第一行')
      Text('这是第二行')
        .backgroundColor('#996633')
        .width('100%')
        .fontColor('#fff') //字体颜色
        .textAlign(TextAlign.Center) //居中对齐
      Text('这是第三行')

      //   横排
      Row({
        space:12 //间距
      }){
        Button('点一下')
        Button('点两下')
        Button('点三下')
        Button('点四下')
        Button('点五下')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround) //平均分
      .backgroundColor('#339999')
      .padding('18')

      //滚动
      Scroll() {
        Row({
          space:12 //间距
        }){
          Button('点一下')
          Button('点两下')
          Button('点三下')
          Button('点四下')
          Button('点五下')
        }
        .justifyContent(FlexAlign.SpaceAround) //平均分
        .backgroundColor('#339999')
        .padding('18')
      }.scrollable(ScrollDirection.Horizontal)

      //层叠布局
      Stack(){
        Button('按钮1')
          .offset({ //以自身的位置进行偏移
            bottom:120
          }).align(Alignment.Bottom) //按钮内部的字进行移动
        Button('按钮2')
        Button('按钮3')
          .margin({
            top:80
          })
        Text('这是一段文本')
      }
      .backgroundColor('#993399')
      .width('80%')
      .height(300)

      //相对布局容器
      RelativeContainer(){
        Button('按钮1')
          .offset({
            top:40
          })
        Button('按钮2')
        Button('按钮3').offset({
          top:80
        })
      }
      .width('80%')
      .height(150)
      .backgroundColor('#333366')
      }


  }
}