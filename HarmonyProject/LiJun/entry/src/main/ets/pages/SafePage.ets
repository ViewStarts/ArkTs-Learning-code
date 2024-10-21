@Entry
@Component
struct SafePage {


  build() {
    Column(){
      Column()
        .width('100%')
        .backgroundColor('0033ff')
      // 扩展安全区域
      Text('关于')
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#990033')
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])
  }
}