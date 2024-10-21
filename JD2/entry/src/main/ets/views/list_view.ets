import { rcp } from '@kit.RemoteCommunicationKit';

interface FirstCate{
  paneKey:string;
  title:string;
}

interface secondCate{
  areaId:string;
}

interface level1words{
  level2words:level2words[]
  keyword:string;
  keywordid:string;
}

interface level2words{
  keywordId:string;
  keyword:string;
  imageUrl:string;
}

function loadDataFromServer(cid:string='2094'){
  const session=rcp.createSession({
    headers:{
      origin:"https://minicaty-pro.pf.jd.com"
    }
  })

  return session.get(`https://api.m.jd.com/api?functionId=mbf_queryCategory&appid=jd-cphdeveloper-m&body=%7B%22tenantCode%22%3A%22jgm%22%2C%22bizModelCode%22%3A%225%22%2C%22loginWQBiz%22%3A%22golden-trade%22%2C%22bizModeFramework%22%3A%22h5%22%2C%22bizModeClientType%22%3A%22M%22%2C%22uuid%22%3A%225187470892203916594%22%2C%22externalLoginType%22%3A%221%22%2C%22categoryId%22%3A%22${cid}%22%7D&loginType=2`)
    .then(res=>{
      return res
    })
}

@Component
export struct ListView {
  @State selFirstType:string='2094'
  @State firstCates:FirstCate[]=[]
  @State level1words:level1words[]=[]

aboutToAppear(): void {
    loadDataFromServer()
      .then(res=>{
        this.firstCates=res.toJSON()!['data']['firstCate'] as FirstCate[]
        this.firstCates.splice(0,1)
      })
   this.initContentList(this.selFirstType)
}

  initContentList(cid:string){
    this.selFirstType=cid
    loadDataFromServer(cid)
      .then(res=>{
        this.level1words=res.toJSON()!['data']['secondCate']['level1words'] as level1words[]
        this.level1words.splice(0,1)
      })
  }


  build() {
    Column() {
      Search({
        placeholder:'请输入关键词'
      })
        .borderRadius(4)
        .margin('0')

      Row() {
        Scroll() {
          Column({
            space: 6
          }) {
            ForEach(this.firstCates,(item:FirstCate)=>{
              Text(item.title)
                .height('36')
                .backgroundColor(this.selFirstType===item.paneKey?'#fff':'')
                .width('100%')
                .textAlign(TextAlign.Center)
                .onClick(()=>{
                  this.initContentList(item.paneKey)
                })
            },(item:FirstCate)=>item.paneKey)

          }
        }
        .align(Alignment.Top) //里面的内容顶部排列
        .height('100%')
        .width('80')
        .backgroundColor('#f9f9f9')
        .scrollBar(BarState.Off)

        //右侧
        Scroll(){
          Column(){
          ForEach(this.level1words,(item:level1words)=>{
            Text(item.keyword)
              .width('100%')
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
            List(){
                ForEach(item.level2words,(item:level2words)=>{
                  ListItem(){
                    Column(){
                      Image(item.imageUrl)
                        .width(80)
                      Text(item.keyword)
                    }
                  }
                },(item:level2words)=>item.keywordId)
            }.lanes(3)
          },(item:level1words)=>item.keywordid)
        }
        }
        .height('100%')
        .scrollBar(BarState.Off)
        .align(Alignment.Top) //里面的内容顶部排列
        .layoutWeight(1)
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}