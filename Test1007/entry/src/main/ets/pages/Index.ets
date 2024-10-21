
@CustomDialog
struct MyAdDialog{
  controller?:CustomDialogController
  closeHandle:()=>void=()=>{}
  @State timer:number=5

  aboutToAppear(): void {
    let r=setInterval(()=>{
      this.timer--
      if(this.timer==0){
        clearInterval(r)
        this.closeHandle() // 关闭弹窗
      }
    },1000)
  }

  build() {
    Column(){
      // Text('文本')
      Row(){
        Text(`${this.timer}s关闭`)
          .fontColor('#ebebeb')
        Text('X')
          .fontSize(20)
          .fontColor('#ebebeb')
          .backgroundColor('#f00')
          .padding(2)
      }
      .position({
        top:10,
        right:10
      })
      .zIndex(10)
      Image('https://img2.baidu.com/it/u=2505922960,4089522835&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=889')
        .width('100%')
    }
  }
}

@Entry
@Component
struct Index {
  customerDialog:CustomDialogController=new CustomDialogController({
    autoCancel:false,
    onWillDismiss:()=>{
    // 什么都不写，他就是为了覆盖我的关闭操作
    },
    builder:MyAdDialog({
      closeHandle:()=>{
        this.customerDialog.close()
      }
    }) // 自定义弹窗的内容
  })

  build() {
    Column() {
      Button("自定义弹出")
        .onClick(()=>{
        //
          this.customerDialog.open() // 打开弹窗
        })
    }
    .height('100%')
    .width('100%')
  }
}