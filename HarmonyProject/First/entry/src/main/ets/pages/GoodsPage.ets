//自定义组件
import { promptAction } from '@kit.ArkUI'

@Component
struct GoodsView { //定义一个组件
  @Require @Prop name:string='' //父传子，用属性，子组件定义name、price属性
  @Prop price:number=1
  @Link mpp:number //@Link定义的数据，不能设置初始值，需要从外面传进来，改变之后对应的数据会跟着响应式变化
  say:()=>void=()=>{} //往组件中传递函数
  build() {
    Column() {
      Text(this.name)
      Text('￥'+this.price+'元')
        .onClick(()=>{
          this.price--
        })
      Text(this.mpp+',传递过来的') //原来的pp一旦改变，这个pp也会改变
        .onClick(()=>{
          this.mpp++ //这个改变，原来的pp不会改变，是全新的值
        })
      Button('点击触发say函数')
        .onClick(()=>{
          this.say()
        })
    }
    .backgroundColor('#7c999999')
    .padding(12)
    .width('100%')
  }
}

@Entry
@Component
struct GoodsPage {
  @State pp:number=100 //动态数据

  build() {
    Column() {
      Text('pp:'+this.pp)
      Button('点击pp减1')
        .onClick(()=>{
          this.pp--
        })
      GoodsView({
        name:'时崎狂三',
        price:1221,
        mpp:this.pp, //传一个动态数据
        say:()=>{
          // console.log('我是传递进来的数据')
          promptAction.showToast({
            message:'这是我传递进来的参数'
          })
        }
      })
      GoodsView({
        name:'五河琴里',
        price:243100,
        mpp:this.pp //传一个动态数据
      })
      GoodsView({
        name:'五河琴里',
        price:243100,
        mpp:this.pp //传一个动态数据
      })
    }
    .height('100%')
    .width('100%')
  }
}