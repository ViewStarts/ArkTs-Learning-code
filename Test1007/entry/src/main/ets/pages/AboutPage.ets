@Entry
@Component
struct AboutPage {
  @State message: string = 'Hello World';
  @State isRefreshing: boolean = false

  @Builder
  myRefresh() {
    Text(this.isRefreshing?'刷新中...':'好了!!!')
  }

  build() {
    Column() {

      // 刷新组件
      Refresh({
        refreshing: $$this.isRefreshing, //双向绑定
        builder: this.myRefresh() //绑定代码块
      }) {
        Column() {
          Text('A')
          Text('B')
          Text('C')
        }
      }.onRefreshing(() => {
        console.log('进行刷新')
        setTimeout(() => {
          this.isRefreshing = false //结束刷新
        }, 3000)
      })

      Text(this.message)
        .id('AboutPageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}