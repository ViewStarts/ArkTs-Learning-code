import { router } from '@kit.ArkUI' //1.引入arkUI

//提前定义好数据类型
interface PageParams{
  id:string;
  name:string;
}

@Entry
@Component
struct ListPage {

  // 生命周期钩子函数，组件创建的时候执行
  aboutToAppear(): void {
    //需要定义一个数据类型，通过as进行数据类型强制转换
    const obj:PageParams=router.getParams() as PageParams //定义类型
    console.log(JSON.stringify(obj)) //console不能打印对象，这里转换为字符串
    console.log(obj.name)
  }

  build() {
    Column() {
      Text('这是详情页')
      Button('去列表页')
        .onClick(()=>{
          //替换当前页
          router.replaceUrl({
            url:'view/ListPage' //2.跳转的地址
          })
        })

    }
    .height('100%')
    .width('100%')
  }
}