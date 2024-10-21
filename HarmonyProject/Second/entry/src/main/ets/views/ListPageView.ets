// 列表页
@Component
export  struct ListPageView{
  pathStack:NavPathStack=new NavPathStack()
  build() {
    //所有的子页面都需要在最外层包含NavDestination这个节点
    NavDestination(){
      Column(){
        Text('列表页')
        Button('去详情页')
          .onClick(()=>{
            this.pathStack.pushPath({
              name:'DetailPage'
            })
          })
      }
    }
    .title('列表页') //标题
    .onReady((context)=>{
      this.pathStack=context.pathStack //从上下文中获取pathStack参数，这个数据一定要和第一个的页面的数据对应上

      this.pathStack.getParamByName('ListPage') //获取ListPage里面的参数，是obj那个对象的值
      // 可以用来获取参数
    })
  }
}