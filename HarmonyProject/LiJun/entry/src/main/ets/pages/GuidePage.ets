const  images:string[]=[
  'https://img1.baidu.com/it/u=300310559,4175023827&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=675',
  'https://img2.baidu.com/it/u=2828890682,250993489&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=675',
  'https://img1.baidu.com/it/u=1260603267,260044629&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=530',
  'https://img1.baidu.com/it/u=3092160517,3619377119&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=675'
]

@Entry
@Component
struct GuidePage {
@State imgIndex:number=0

  build() {
  RelativeContainer(){
    Image(images[this.imgIndex])
      .width('100%')
      .height('100%')
      .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP]) //安全区域填充

    Column({space:20}){
      Row()
        .width(60)
        .height(2)
        .backgroundColor('#c9999999')


      Swiper(){
        Column({
          space:12
        }){
          Text('高育良')
          Text('你看，又急。我当国家主席，你掏粪，都是为人民服务嘛。')
            .width('80%')
            .textAlign(TextAlign.Center)
        }
        Column({
          space:12
        }){
          Text('高育良')
          Text('你看，又急。我当国家主席，你掏粪，都是为人民服务嘛。')
            .width('80%')
            .textAlign(TextAlign.Center)
        }
        Column({
          space:12
        }){
          Text('高育良')
          Text('你看，又急。我当国家主席，你掏粪，都是为人民服务嘛。')
            .width('80%')
            .textAlign(TextAlign.Center)
        }
        Column({
          space:12
        }){
          Text('高育良')
          Text('你看，又急。我当国家主席，你掏粪，都是为人民服务嘛。')
            .width('80%')
            .textAlign(TextAlign.Center)
        }

      }
      .height(110)
      .width('100%')
      // .height(20)
      .indicator(
        Indicator.dot()
          .color('#cecece')
          .selectedColor('#ff459245')

      )
      .autoPlay(true)
      .onChange(index=>{
      //   根据索引可以切换图片
        this.imgIndex=index
      })
      Text('跳过')
      Button('下一步')
        .width('80%')
    }
    .padding(12)
    .width('100%')
    .height('35%')
    .backgroundColor('#fff')
    .borderRadius({
      topLeft:20,
      topRight:20
    })
    .position({
      bottom:0,
      left:0
    })
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.BOTTOM]) //安全区域填充
    }
    .height('100%')
    .width('100%')
  }
}