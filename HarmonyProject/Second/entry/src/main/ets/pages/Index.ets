import { promptAction } from '@kit.ArkUI'
import {ListPageView} from '../views/ListPageView'
import {DetailPageView} from '../views/DetailPageView'
// 引入模块
import {sum,PostsPage} from '@lznb/tools'


interface IListPageParams{
  id:number;
  name:string;
  age:number;
}


@Entry
@Component
struct Index {

  @State tanIndex:number=0 //当前tab的索引

  // 创建一个实例，用来绑定当前的页面
  pathStack:NavPathStack=new NavPathStack()
  // 控制器
  tabController:TabsController=new TabsController()

  //定义PageMap函数，点击跳转以后触发这个函数
  @Builder
  PageMap(name: string) {
    // 根据传递的name属性展示对应的页面组件
    if (name === "ListPage") {
      //设置对应的页面
      ListPageView() //展示组件
    } else if (name === "DetailPage") {
      DetailPageView()
    } else if (name === "IndexPage") {
      Index()
    }
  }

  build() {
    Navigation(this.pathStack){
      Column(){
        Tabs({
          controller:this.tabController //通过一个controller属性实现组件和一个变量的绑定
          // 然后我们就可以通过这个变量操作组件的一些行为
        }){
          TabContent(){
            Column(){
              Text('时崎狂三')
              Button('去列表页')
                .onClick(()=>{
                  const obj:IListPageParams={
                    id:10001,
                    name:'我爱你五河琴里',
                    age:18
                  }
                  // 通过上面创造的实例，跳转到指定的页面，会执行绑定PageMap函数
                  this.pathStack.pushPath({
                    name:'ListPage',
                    param:obj //传参，把obj这个对象的参数通过param传到二级菜单里面去
                  })
                })
            }
          }
          TabContent() {
            Text('五河琴里')
          }
          TabContent() {
            Text('五河士道')
          }
          TabContent() {
            Text('鸢一折纸')
          }
        }
        .scrollable(false) //禁止滑动切换


      }
    }
    .toolbarConfiguration([{ //设置底部导航
      value:'首页', //文字
      //行为，类似点击事件
      action:()=>{
        promptAction.showToast({
          message:'首页'
        })
        this.tabController.changeIndex(0) //点击切换选项卡为第一个
        this.tanIndex=0

      },
      icon:$rawfile('image/花火4k.ico'), //没有点击时候的小图标
      activeIcon:$rawfile('image/花火4k.ico'), //点击以后的小图标
      status:this.tanIndex==0?ToolbarItemStatus.ACTIVE:ToolbarItemStatus.NORMAL, //默认选中这个路由
      //rawfile这个资源文件夹进行打包的时候,他不会打包到主文件里面，而是作为资源文件进行拷贝
    },{
      value:'列表',
      icon:$rawfile('image/logo.ico'), //没有点击时候的小图标
      activeIcon:$rawfile('image/logo.ico'), //点击以后的小图标
      // activeSymbolIcon: {}, //更改选中的颜色
      status:this.tanIndex==1?ToolbarItemStatus.ACTIVE:ToolbarItemStatus.NORMAL, //默认选中这个路由
      action:()=>{
        this.tabController.changeIndex(1) //点击切换选项卡为第二个
        this.tanIndex=1
      }
    },{
      value:'论坛',
      icon:$rawfile('image/god.ico'), //没有点击时候的小图标
      activeIcon:$rawfile('image/god.ico'), //点击以后的小图标
      action:()=>{
        this.tabController.changeIndex(2) //点击切换选项卡为第三个
        this.tanIndex=2
      },
      status:this.tanIndex==2?ToolbarItemStatus.ACTIVE:ToolbarItemStatus.NORMAL, //默认选中这个路由
    },{
      value:'我的',
      icon:$rawfile('image/favicon.ico'), //没有点击时候的小图标
      activeIcon:$rawfile('image/favicon.ico'), //点击以后的小图标
      action:()=>{
        this.tabController.changeIndex(3) //点击切换选项卡为第四个
        this.tanIndex=3
      },
      status:this.tanIndex==3?ToolbarItemStatus.ACTIVE:ToolbarItemStatus.NORMAL, //默认选中这个路由
    }])
      .title('我的牧场') //标题
    // .hideTitleBar(true) //隐藏标题栏
    .navDestination(this.PageMap) //设置二级页面
    //页面跳转，点击以后触发PageMap函数
  }
}