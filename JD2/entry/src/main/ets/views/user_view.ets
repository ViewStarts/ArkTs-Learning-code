import { router } from '@kit.ArkUI'

@Component
export struct UserView {
  build() {
    Column() {
      Column() {
        Image('https://img1.baidu.com/it/u=683302077,3976468347&fm=253&fmt=auto&app=120&f=JPEG?w=801&h=500')
          .width(200)
          .height(200)
          .borderRadius(100)
          .border({
            style: BorderStyle.Solid,
            width: 10,
            color: '#fff'
          })
        Text('崇宫真那')
          .margin({
            top: 20
          })
          .fontColor('#fff')
          .fontSize(18)

      }
      .width('100%')
      .height('300')
      .backgroundColor('#99cc33')
      .alignItems(HorizontalAlign.Center) //垂直居中对齐
      .justifyContent(FlexAlign.Center) //水平居中

      Row() {
        Text('我的信息')
        Blank()
        Text('>')
      }
      .width('100%')
      .padding({
        top: 8,
        bottom: 8,
        left: 20,
        right: 20
      })

      Divider()
      Row() {
        Text('支付记录')
        Blank()
        Text('>')
      }
      .width('100%')
      .padding({
        top: 8,
        bottom: 8,
        left: 20,
        right: 20
      })

      Divider()
      Row() {
        Text('历史记录')
        Blank()
        Text('>')
      }
      .width('100%')
      .padding({
        top: 8,
        bottom: 8,
        left: 20,
        right: 20
      })

      Divider()
      Row() {
        Text('修改密码')
        Blank()
        Text('>')
      }
      .width('100%')
      .padding({
        top: 8,
        bottom: 8,
        left: 20,
        right: 20
      })

      Divider()
      Row() {
        Text('我的收藏')
        Blank()
        Text('>')

      }
      .width('100%')
      .padding({
        top: 8,
        bottom: 8,
        left: 20,
        right: 20
      })

      Divider()

      Row() {
        Text('我的订单')
        Blank()
        Text('>')

      }
      .width('100%')
      .padding({
        top: 8,
        bottom: 8,
        left: 20,
        right: 20
      })

      Divider()

      Button('登录')
        .margin({
          top: 20
        })
        .width('75%')
        .type(ButtonType.Normal)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/LoginPage'
          })
        })
    }
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}