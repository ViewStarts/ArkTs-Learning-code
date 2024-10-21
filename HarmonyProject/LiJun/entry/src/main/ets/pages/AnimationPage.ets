@Entry
@Component
struct AnimationPage {
@State cHeight:number=200 //通过@state装饰器设置一个响应式的数据

  build() {

   Column(){
     Button('变形')
       //添加点击事件
       .onClick(()=>{
         if(this.cHeight<300){
           this.cHeight+=100
         }else{
           this.cHeight=200
         }
       })
     Column(){

     }
     .height(this.cHeight)
     .width('80%')
     // 通过animation实现
     .animation({
       duration:5000, //时间  delay:延时时间
       curve:Curve.Linear //动画速度曲线 Linear线性速度
     })
     .backgroundColor('#883366')
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)

  }
}