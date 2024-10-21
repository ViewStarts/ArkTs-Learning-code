// 装饰器
import { CircleShape } from '@kit.ArkUI';
import { InputMethodListDialog } from '@ohos.inputMethodList';

@Entry //主入口，一个页面只能有一个主入口
@Component //组件
struct Index {
  // struct 表示结构体

  // @State 装饰器修饰的数据是一个响应式的数据，数据改变之后页面会自动更新
  @State message: string = '请输入内容';  //定义一个数据

  // 每一个组件都需要一个build函数，这个函数里面写的是组件的内容
  // 在这个函数内不能写console.log输出，不能switch case
  // 组件定义的时候，build函数的最外层只能有一个根节点
  build() {
    // RelativeContainer() 相对布局的容器
    // 如果组件可以设置子组件，那么使用{ 子组件 }
    // Column() 线性布局 列的意思，从上往下一个一个排
    Column({
      space:12
    }) {
      Image("https://img.clnya.fun/chlorine-coder.webp")
        .width('40%')
        .borderRadius('300px')
        .margin({
          top:'10'
        })// 如果模拟器中使用网络图片，需要设置权限
      Text($r("app.string.Login_title"))
      TextInput({
        placeholder:'请输入用户名'
      }).borderRadius(10)
        .margin({
          top:'10'
        })
      TextInput({
        placeholder:'请输入密码'
      }).borderRadius(10)
        .type(InputType.Password)
      //  .type(InputType.PhoneNumber)
      Button("登录")
        .width('100%')
        .onClick(()=>{
          console.log('你好')
          console.log(123+'')
        })
        .backgroundColor('#ff56632')
        .fontColor('black')
        .type(ButtonType.Normal)
        .borderRadius('30px')

      // 跳转
      Navigator({
        target:'pages/RegPage' //目标页
      }){
        Text('没有账号，我要注册')
          .width('100%')
          .textAlign(TextAlign.End)
          .fontSize('14')
          .fontColor('#999')
      }



    }
    .height('100%') //高度 单位是vp 屏幕像素比
    .width('100%')  //宽度
    .backgroundColor('#52963299')
  }
}