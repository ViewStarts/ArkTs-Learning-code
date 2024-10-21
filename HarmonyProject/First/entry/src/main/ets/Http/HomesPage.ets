import { http } from '@kit.NetworkKit'
import { router } from '@kit.ArkUI';

// 1.定义类型
interface Goods {
  goods_id: string;
  name: string;
  cover_url: string;
  price: string;
}

@Entry
@Component
struct HomesPage {
  @State listData: Goods[] = [] //做一个空的数组，类型是Goods数组
  @State page:number=1

  //定义一个函数
  loadData() {
    const httpReauest = http.createHttp()
    httpReauest.request('https://api-mall.mihoyogift.com/common/homeishop/v1/goods/search_goods_spu_list?limit=40&page='+this.page+'&shop_code=bh3&order_by=comprehensive&show_sale_type=1&hide_sold_out=false&random=true',
      {
        //第一个表示请求地址，第二个表示配置信息
        method: http.RequestMethod.GET, //GET请求，我们需要设置请求方式的时候使用内置的枚举类型
        extraData: {}, //数据
        expectDataType: http.HttpDataType.OBJECT //返回的数据类型
      })
      .then(res => {
        console.log(JSON.stringify(res.result)) //把对象转换为字符串
        // 需要对object对象做as操作，转换为已知的数据类型，不然他不知道数据里有什么数据类型
       const tmpList = res.result['data']['list'] as Goods[] //2.取出list列表的值，as强制类型转换为Goods的数组
       this.listData.push(...tmpList) //加载更多
        //得到的值赋给listData，然后页面直接展示listData即可
        this.page++
      })
  }

  build() {
    Column() {
      Button('获取数据')
        .onClick(() => {
          this.loadData()
        })

      List() {
        ForEach(this.listData, (item: Goods) => {
          ListItem() {
            Column({
              space:2
            }) {
              Image(item.cover_url)
                .width('90%')
                .onClick(()=>{
                  router.pushUrl({ //点击跳转到详情页
                    url:'Http/DetailsPage',
                    params:{
                      id:item.goods_id
                    }
                  })
                })
              Text(item.name)
                .maxLines(2)
                .textOverflow({
                  overflow:TextOverflow.Ellipsis
                })
                .ellipsisMode(EllipsisMode.END)
              Text('$'+item.price+'元')
                .fontColor('#ee0000')
                .fontStyle(FontStyle.Italic)
                .fontWeight(FontWeight.Bold)
            }
            .shadow({
              offsetX:0,
              offsetY:1,
              color:'#ccc',
              radius:2
            })
            .padding(4)
          }
        }, (item: Goods) => item.goods_id)
      }.width('100%')
      .lanes(2)
      .backgroundColor('#23cccccc')
      .onReachEnd(()=>{
        //页面触底之后执行
        this.loadData()
      })
      .layoutWeight(1) //占满剩下的空间

    }
    .height('100%')
    .width('100%')
  }
}