import { router } from '@kit.ArkUI'
import { http } from '@kit.NetworkKit';

interface Goods{
  id: string;
  cover_url:string;
}

@Entry
@Component
struct DetailsPage {
  @State List:Goods[]=[]
  // https://api-mall.mihoyogift.com/common/homeishop/v1/goods/detail?goods_id=2024484388689124806656
  // 生命周期钩子函数，组件创建的时候执行
  aboutToAppear(): void {
    const  obj:Goods=router.getParams() as Goods //接受传递的参数，赋值给obj
    http.createHttp().request(`https://api-mall.mihoyogift.com/common/homeishop/v1/goods/detail?goods_id=${obj.id}`,{
      expectDataType:http.HttpDataType.OBJECT //返回的数据类型，默认是字符串不是对象，通过第二个参数把字符串转换为对象
    })
      .then(res=>{
        console.log(JSON.stringify(res.result))
      })
  }

  build() {
    Column() {

    }
    .height('100%')
    .width('100%')
  }
}