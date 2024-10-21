import { promptAction, router } from '@kit.ArkUI'
import { logo } from '../components/logo'

@Entry
@Component
struct LoginPage {
  @State isAllowRules:boolean=false
  @State userName:string=''
  @State passWord:string=''

  build() {
    Column({
      space:8
    }){
      logo()
      TextInput({
        placeholder:'请输入用户名',
        text:$$this.userName
      })
        .borderRadius(4)
      TextInput({
        placeholder:'请输入密码',
        text:$$this.passWord
      })
        .borderRadius(4)
        .type(InputType.Password)
      Row(){
        Checkbox()
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .select(this.isAllowRules)
          .onChange((v)=>{
            this.isAllowRules=v
          })
        Text('是否同意用户协议?')
          .fontSize(12)
          .onClick(()=>{
            this.isAllowRules=!this.isAllowRules
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      Button('登录')
        .width('75%')
        .type(ButtonType.Normal)
        .onClick(()=>{
          if(this.isAllowRules){
            if(this.userName&&this.passWord){
              promptAction.showToast({
                message:'登录成功!'
              })
            }else{
              promptAction.showToast({
                message:'请输入用户名和密码'
              })
            }
          }else{
            promptAction.showToast({
              message:'请勾选用户协议'
            })
          }
        })
      Text('没有账号，我要注册!!!')
        .width('100%')
        .textAlign(TextAlign.End)
        .fontSize(14)
        .fontColor('#999')
        .onClick(()=>{
          router.replaceUrl({
            url:'pages/RegPage'
          })
        })
    }
    .height('100%')
    .width('100%')
    .padding(12)
  }
}