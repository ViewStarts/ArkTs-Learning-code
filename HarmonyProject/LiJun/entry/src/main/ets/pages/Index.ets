import {username} from '../View/index'
@Entry
@Component
struct Index {


  build() {
    RelativeContainer() {
      Tabs(){
        TabContent(){

        }.tabBar('首页')
        TabContent(){

        }.tabBar('分类')
        TabContent(){

        }.tabBar('购物车')
        TabContent(){
          username()
        }.tabBar('我的')
      }
      .barPosition(BarPosition.End)
      .scrollable(false)
    }
    .height('100%')
    .width('100%')
  }
}