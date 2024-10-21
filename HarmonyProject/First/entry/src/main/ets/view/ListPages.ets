import { router } from '@kit.ArkUI'

@Entry
@Component
struct ListPage {


  build() {
    Column() {
      Text('这是列表页')

      Column(){
        Text('夏娜')
        Button('详情')
          .onClick(()=>{
            // 路由有两种模式
            // router.RouterMode.Standard 默认模式
            // router.RouterMode.Single 单例模式
            router.pushUrl({
              url:'view/DetailPage', //地址
              params:{ //表示我们要传递的数据，参数
                id:1,
                name:'燃烧灼眼的魔女'
              }
            },router.RouterMode.Single)
          })
      }
      .padding(12)
      .backgroundColor('#999933')
      .margin(8)

      Column(){
        Text('五河琴里')
        Button('详情')
          .onClick(()=>{
            router.pushUrl({
              url:'view/DetailPage', //地址
              params:{ //表示我们要传递的数据，参数
                id:2,
                name:'约战中强大的精灵'
              }
            })
          })
      }
      .padding(12)
      .backgroundColor('#999933')
      .margin(8)

    }
    .height('100%')
    .width('100%')
  }
}