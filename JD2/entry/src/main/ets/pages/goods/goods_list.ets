import { promptAction, router } from '@kit.ArkUI'
import { rcp } from '@kit.RemoteCommunicationKit'

const Server = 'http://192.168.14.46:1337'

/**
 *
 * @param url
 * @returns
 */
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

interface keyword {
  keyword: string
}

interface Goods {
  id: string;
  name: string;
  coverImage: string;
  category: category;
  price: number;
}

interface category {
  id: string;
  name: string;
  coverImage: string;
}

/**
 *
 * @param page
 * @param keyword
 * @returns
 */
//获取商品列表信息 page 页码 keyword 查询关键词
function loadDataFromServer(page: number = 1, keyword: string = '') {
  let session = rcp.createSession({})
  //url中默认不能传递中文的，需要进行特殊的编码处理
  return session.get(`${Server}/api/v1/products?page=${page}&name=${encodeURI(keyword)}`)//这里的Ip要根据不同的服务器地点进行更改
    .then(res => {
      return res.toJSON()!['data'] as Goods[]
    })
}

@Entry
@Component
struct ListPage {
  @State keyword: string = ''
  @State goodsList: Goods[] = []
  @State page: number = 1

  aboutToAppear(): void {
    this.keyword = (router.getParams() as keyword).keyword
    loadDataFromServer(1, this.keyword)
      .then(res => {
        res.forEach(item => {
          this.goodsList.push({
            id: item.id,
            name: item.name,
            price: item.price,
            coverImage: dalImg(item.coverImage), //处理图片地址数据
            category: item.category
          })
        })
        this.page++
      })
  }

  build() {
    Column() {
      Search({
        placeholder: '请输入关键词'
      })
        .onSubmit((v) => {
          this.keyword = v
          this.goodsList = []
          this.page = 1
          loadDataFromServer(1, this.keyword)
            .then(res => {
              res.forEach(item => {
                this.goodsList.push({
                  id: item.id,
                  name: item.name,
                  price: item.price,
                  coverImage: dalImg(item.coverImage), //处理图片地址数据
                  category: item.category
                })
              })
              this.page++
            })
        })
        .borderRadius(4)
        .margin({
          top: 0,
          bottom: 0,
          left: 2,
          right: 2
        })

      List({
        space: 2
      }) {
        ForEach(this.goodsList, (item: Goods) => {
          ListItem() {
            Column({
              space: 4
            }) {
              Image(item.coverImage)
                .width('85%')
              Text(item.name)
                .maxLines(2)
                .height(30)
                .textOverflow({
                  overflow: TextOverflow.Ellipsis
                })

              Row(){
                Text(){
                  Span("￥")
                  Span(item.price+'')
                    .fontColor('#ff2200')
                }
                Blank()
                Button('购买')
                  .onClick(()=>{
                    router.pushUrl({
                      url:'pages/goods/detail',
                      params:{
                        id:item.id
                      }
                    })
                  })
                  .type(ButtonType.Normal)
                  .backgroundColor('#ff6600')
              }
              .width('80%')
            }
            .padding(4)
            .margin(2)
            .shadow({
              color: '#ffe7c3f1',
              offsetX: 0,
              offsetY: 1.5,
              radius: .5
            })
          }
        }, (item: Goods) => item.id)
      }
      .layoutWeight(1)
      .lanes(2)
      .onReachStart(() => {
        promptAction.showToast({
          message: '到顶了'
        })
      })
      .onReachEnd(() => {
        // 如果没有数据的时候，会直接触发这个到底的函数，所以我加一个判断
        if (this.goodsList.length > 0) {
          loadDataFromServer(this.page, this.keyword)
            .then(res => {
              res.forEach(item => {
                this.goodsList.push({
                  id: item.id,
                  name: item.name,
                  price: item.price,
                  coverImage: dalImg(item.coverImage),
                  category: item.category
                })
              })
              this.page++
            })
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}