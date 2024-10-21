import { promptAction, PromptAction } from '@kit.ArkUI';

@Entry
@Component
struct FlexPage {
  // 在arkts中我们可以使用@state定义一个响应式的数据
  @State count:number=1
  @State name:string='请输入文本'

  build() {
    Flex({
      direction:FlexDirection.Column,
      // justifyContent:FlexAlign.SpaceBetween
    }){
      RelativeContainer(){
        Text('为了德玛西亚')
          .textAlign(TextAlign.Center)
          .fontColor('#fff')
          .fontSize(20)
          .width('100%')
        Button('登录')
          .onClick(()=>{
            promptAction.showToast({
              message:"这是一个轻提示弹窗"
            })
          })
      }
        .height(80)
        .backgroundColor('#339933')
        .width('100%')
      Column(){
        Text('这是第一行')
        Text('这是第二行')
        Text('这是第三行')
      }
      Row()
        .height(50)
        .backgroundColor('#669966')
        .width('100%')
      Row(){
        Text(this.name)
        TextInput({
          placeholder:'请输入内容'
        })
          .cancelButton({})
          .onChange((e)=>{
          this.name=e
        })
          .margin({
            top:10
          })
          .width('30%')
        Button(this.count+'')
          .onClick(()=>{
            this.count++
          })
          .type(ButtonType.Normal)
          .margin(10)
        Button('保存',{
          type:ButtonType.Normal
        })
      }


    }
    .flexGrow(1)
    .height('100%')
    .width('100%')
  }
}