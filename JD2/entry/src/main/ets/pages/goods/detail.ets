import { promptAction, router } from '@kit.ArkUI'
import { rcp } from '@kit.RemoteCommunicationKit';

const Server = 'http://192.168.14.46:1337'

function dalImg(url: string) {
  if (url) {
    if (url.startsWith('http')) {
      return url;
    } else {
      return Server + url
    }
  }
  return 'https://img0.baidu.com/it/u=3464850806,2136683181&fm=253&fmt=auto&app=138&f=JPG?w=500&h=281'

}

interface Goods {
  id?: string;
  name?: string;
  coverImage?: string;
  category?: category;
  price?: number;
}

interface category {
  id: string;
  name: string;
  coverImage: string;
}

function loadDataFromServer(id: number) {
  let session = rcp.createSession({})
  return session.get('http"//192.168.14.46:1337/api/v1/products/' + id)
    .then(res => {
      return res.toJSON()!['data'] as Goods
    })
}

interface params {
  id: number;
}

@Entry
@Component
struct Detail {
  @State goods: Goods | undefined = undefined

  aboutToAppear(): void {
    console.log('detail---aboutToAppear')
    // 此处一般用来调接口获取数据
    const params = router.getParams() as params
    if (params && params.id) {
      // promptAction.showToast({
      //   message:params.id+'' //number类型不能做轻提示
      // })
      loadDataFromServer(params.id)
        .then(res => {
          this.goods = res
        })

    }
  }

  // 只有在组件设置为@Entry之后才有的声明周期钩子函数 onPageShow onPageHide
  // 页面展示的时候执行
  onPageShow(): void {
    console.log('detail---onPageShow')
  }

  // 页面隐藏的时候执行
  onPageHide(): void {
    console.log('detail---onPageHide')
  }

  // build之后执行
  onDidBuild(): void {
    console.log('detail---onDidBuild')
  }

  // 组件销毁的时候执行
  aboutToDisappear(): void {
    console.log('detail---aboutToDisappear')
  }

  build() {
    // Column() {
    //   Swiper() {
    //     Image(dalImg(this.goods?.coverImage!))
    //       .width('100%')
    //   }
    //
    //   Text(this.goods?.name)
    //   Text('￥' + this.goods?.price)
    //   Tabs() {
    //     TabContent() {
    //       Text('这里是详情')
    //     }.tabBar('详情')
    //
    //     TabContent() {
    //       Column() {
    //         Text('整箱')
    //         Text('全国包邮')
    //         Text('买一送一')
    //         Text('中国80周年')
    //       }
    //     }.tabBar('规格')
    //
    //     TabContent() {
    //       Column({
    //         space: 8
    //       }) {
    //         Column() {
    //           Text('王者荣耀这个好玩')
    //           Text('房东与猫 164***924234')
    //           Divider()
    //         }
    //
    //         Column() {
    //           Text('英雄联盟')
    //           Text('卫视 1234***924234')
    //           Divider()
    //         }
    //
    //         Column() {
    //           Text('拉黑游戏')
    //           Text('在宿舍 132***921221')
    //           Divider()
    //         }
    //       }
    //     }.tabBar('评价')
    //
    //     TabContent() {
    //       Column() {
    //         Image('')
    //         Text('华为手机')
    //       }
    //     }.tabBar('相关推荐')
    //   }
    // }
    // .height('100%')
    // .width('100%')
  }
}