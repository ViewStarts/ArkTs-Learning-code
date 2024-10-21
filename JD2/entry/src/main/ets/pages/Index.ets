import { CartView } from '../views/cart_view'
import { HomeView } from '../views/home_view'
import { ListView } from '../views/list_view'
import { UserView } from '../views/user_view'


@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0 //当前tabs选中的标签索引


  build() {
    Column() {
      Row()
        .backgroundColor('#99cc33')
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
        .width('100%')
        .visibility(this.currentTabIndex===3?Visibility.Visible:Visibility.Hidden)
      Tabs() {
        TabContent() {
          HomeView()
        }
        .tabBar('首页')

        TabContent() {
          ListView()
        }
        .tabBar('列表')

        TabContent() {
          CartView()
        }
        .tabBar('购物车')

        TabContent() {
          UserView()
        }
        .tabBar('我的')
      }
      .barPosition(BarPosition.End)
      .scrollable(false)
      .onContentWillChange((pre,index) => {
        this.currentTabIndex = index;
        return true
      })
    }
    .height('100%')
    .width('100%')
  }
}