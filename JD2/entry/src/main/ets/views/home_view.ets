import { router } from '@kit.ArkUI'
import { rcp } from '@kit.RemoteCommunicationKit'
import { http } from '@kit.NetworkKit';
import { webview } from '@kit.ArkWeb';

interface banner {
  id: string;
  coverImage: string;
}

interface cate {
  id: string;
  name: string;
  coverImage: string;
}


function loadBanners(url: string) {
  let session = rcp.createSession({})

  return session.get(url)
    .then(res => {
      return res.toJSON() //返回的数据是一个对象
    })
    .catch((err: Error) => {
      console.log(err.message)
    })
}

const Server = 'http://192.168.14.46:1337'

//对图片进行函数处理
function dalimg(url: string) {
  if (url) {
    if (url.startsWith('http')) {
      return url;
    } else {
      return Server + url
    }
  }
  return 'https://img0.baidu.com/it/u=3464850806,2136683181&fm=253&fmt=auto&app=138&f=JPG?w=500&h=281'
}


@Component
export struct HomeView {
  @State banner: banner[] = []
  @State cates: cate[] = []
  webController: WebviewController = new webview.WebviewController //实例对象

  //页面展示的时候执行
  onPageShow(): void {

  }

  aboutToAppear(): void {
    loadBanners('http://192.168.14.46:1337/api/v1/banners')
      .then(res => {
        this.banner = (res!['data'] as banner[]).map((item => {
          return {
            id: item.id,
            coverImage: dalimg(item.coverImage)
          } as banner
        }))
      })

    loadBanners('http://192.168.14.46:1337/api/v1/product_categories')
      .then(res => {
        this.cates = (res!['data'] as cate[]).map((item => {
          return {
            id: item.id,
            name: item.name,
            coverImage: dalimg(item.coverImage)
          } as cate
        }))
      })
  }

  build() {
    Scroll() {
      Column() {
        Search({
          placeholder: '请输入关键词进行搜索'
        })
          .onSubmit((v) => {
            router.pushUrl({
              url: 'pages/goods/goods_list',
              params: {
                keyword: v
              }
            })
          })
          .margin({
            left: 2,
            right: 2,
            bottom: 2
          })
          .borderRadius(2)

        Swiper() {
          ForEach(this.banner, (item: banner) => {
            Image(dalimg(item.coverImage))
              .width('100%')
              .height(200)
          }, (item: banner) => item.id)
        }
        .autoPlay(true)

        List({
          space: 4
        }) {
          ForEach(this.cates, (item: cate) => {
            ListItem() {
              Column() {
                Image(item.coverImage)
                Text(item.name)
              }
            }
          }, (item: cate) => item.id)
        }
        .lanes(3)

        Column() {
          Web({
            src: $rawfile('web/goods.html'),
            controller: this.webController
          })
            /* .javaScriptAccess(true)
               .javaScriptProxy({
                controller:this.webController,
                methodList:[],
                object:{},
                name:'myNative'
            })*/
            .onPageEnd(() => { //生命周期钩子函数，页面加载完成后执行
              //在原生app的代码中调用网页的方法进行处理
              this.webController.runJavaScript('loadProductData(56)')
            })
        }

      }
    }
    .align(Alignment.Top)
    .height('100%')
  }
}