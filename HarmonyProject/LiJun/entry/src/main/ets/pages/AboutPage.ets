@Entry
@Component
struct AboutPage {


  build() {
    Column() {
      Button('按钮',{
        type:ButtonType.Normal
      })
        .backgroundColor('#336633')
        .fontSize(24)
        .padding(30)
        .border({
          width:10,
          style:BorderStyle.Solid,
          color:'#993399'
        })
        .borderRadius(5)
    }
    .height('100%')
    .width('100%')
  }
}