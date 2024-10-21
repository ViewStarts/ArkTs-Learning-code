import { router } from '@kit.ArkUI'
import { logo } from '../components/logo';

@Entry
@Component
struct RegPage {
  @State isAllow:boolean=true;

  build() {
    Column({
      space:8
    }){
      logo()
      TextInput({
        placeholder:'请输入用户名'
      })
        .borderRadius(4)
      TextInput({
        placeholder:'请输入密码'
      })
        .borderRadius(4)
        .type(InputType.Password)
      TextInput({
        placeholder:'请再次输入密码'
      })
        .borderRadius(4)
        .type(InputType.Password)
     Row(){
       Checkbox()
         .shape(CheckBoxShape.ROUNDED_SQUARE)
         .select(this.isAllow)
          Text('是否同意用户注册协议?')
            .fontSize(12)
     }
     .width('100%')
     .justifyContent(FlexAlign.End)
     Button('注册')
       .width('80%')
       .type(ButtonType.Normal)
      Text('已有账号,我要登录!!!')
        .fontSize(12)
        .fontColor('#999')
        .width('100%')
        .textAlign(TextAlign.End)
        .onClick(()=>{
          router.replaceUrl({
            url:'pages/LoginPage'
          })
        })
    }
    .height('100%')
    .width('100%')
    .padding(12)
  }
}