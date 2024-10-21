@Entry
@Component
struct UFlexPage {


  build() {
    Flex({ //默认是横排
      direction:FlexDirection.Column //主轴排列方向设置为竖排
    }){
      Text('Java')
        .backgroundColor('red')
        .width('100%')
        .textAlign(TextAlign.Center)
      Text('Python')
      Text('JavaScript')
      Text('typescript')
        .backgroundColor('#ff0099')
        .flexGrow(1) //撑满剩下的空间，但是竖向的撑满
      Flex(){
        Column(){

        }
        .width('25%')
        .backgroundColor('#fff')
        .height('100%')
        Row(){
          // 竖排
          Column(){
            Text('Hello World!')
            Button('世界你好')
          }
          .flexGrow(1)
          Text('这是最->')
        }
        .flexGrow(1)
      }
      .backgroundColor('#cecece')
      .width('100%')
      .flexGrow(1) //撑满剩下的空间，但是竖向的撑满
    }
    .align(Alignment.Center)
    .width('100%')
    .height('100%')
  }
}