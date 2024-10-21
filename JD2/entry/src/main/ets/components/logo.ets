import { router } from '@kit.ArkUI'

@Component
export struct logo{
  build() {
    Image('https://img2.baidu.com/it/u=1879134043,2694589494&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=500')
      .width('40%')
      .height('120')
      .margin({
        top:50
      })
      .onClick(()=>{
        router.back()
      })
  }
}