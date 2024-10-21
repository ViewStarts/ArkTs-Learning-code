@Entry
@Component
struct AdvertisingPage {
@State title:string='Hello World'
@State Adtime:boolean=true
  @State times:number=5

  //组件创建成功之后执行 生命周期钩子函数
  aboutToAppear(): void {
    let timea=setInterval(()=>{
    this.times--
      if(this.times==0){
        clearInterval(timea)
      }
   },1000)

  }

  build() {
    RelativeContainer() {
      Text(this.title)
        .fontSize(50)
        .fontColor('#2b2b2b')
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center:{anchor:'__container__',align:VerticalAlign.Center},
          middle:{anchor:'__container__',align:HorizontalAlign.Center}
        })
      if(this.times>0){
        Column(){
          Text(this.times+'秒')
            .position({right:0,top:10})
            .fontColor('#fff')
            .fontWeight(FontWeight.Bold)
          Image('/images/renlv.png')
            .margin({top:5})
            .width('85%')
            .height('90%')
            .align(Alignment.Center)
            .zIndex(999)
        }
        .backgroundColor('#4f999999')
        .width('100%')
        .height('100%')
        .alignItems(HorizontalAlign.Center) //水平居中
        .justifyContent(FlexAlign.Center) //垂直居中
      }
    }
    .height('100%')
    .width('100%')
  }
}