import { Listview } from '../View/index'


@Component
struct Home{
  build() {
    Column(){
      Text('风灵月影')
      Text('拉人入会，获取积分成就')
    }
  }
}

@Entry
@Component
struct MainPage {

  // 是自定义渲染，是一个函数，函数里面跟着组件,
  @Builder
tabBarbuild(label:string,img:string){
Column({
  space:5
}){
  Image(img)
    .width(20)
    .height(20)
  Text(label)
    .fontSize(14)
}
}

  build() {
    RelativeContainer() {
    //选项卡
      Tabs(){
        TabContent(){
          // Column(){
          //   Text('首页')
          // }
          Home() //使用自定义组件的方式实现渲染
        }.tabBar({
          text:'首页', //底部名称
          icon:$r('app.media.xqtd') //底部图标
        })
        TabContent(){
          // Text('列表')
          Listview()
        }.tabBar('列表')
        TabContent(){
          Text('购物车')
        }
        .tabBar(this.tabBarbuild('李骏','https://ecmb.bdimg.com/tam-ogel/-504296542_-299042061_200_200.jpg'))
        //使用了builder实现自定义渲染
        TabContent(){
          Text('我的')
        }.tabBar('我的')
      } //选项卡默认在最上方
      .barPosition(BarPosition.End) //选项卡位置在底部
      .scrollable(false) //禁止滑动切换
    }

    .height('100%')
    .width('100%')
  }
}