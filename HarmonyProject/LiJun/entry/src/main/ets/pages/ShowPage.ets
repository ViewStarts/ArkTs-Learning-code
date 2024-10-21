const img: image[] = [
  {
    id: '1001',
    name: '三月七',
    image: '/images/sanyueqi.jpg',
    text: '她是一位被冰埋藏很久的少女，在三月七日被星穹列车搭救， [57]为了寻找身世的真相，三月七选择与星穹列车同行，并使用自己登上星穹列车的三月七日为自己命名。'
  },
  {
    id: '1002',
    name: '芙利莲',
    image: '/images/FuLiLian.jpg',
    text: '打倒魔王的勇者一行的魔法使，长寿的精灵族，人类族大魔法使伏拉梅的徒弟，名字源于德语，意为“冰冻”。芙莉莲在小时候所居住的村子被魔族屠村，而她在杀死魔族将军后为大魔法使伏拉梅所救，并成为了伏拉梅的徒弟'
  },
  {
    id: '1003',
    name: '理之律者',
    image: '/images/LiLv.jpg',
    text: '理之律者是简单易上手的冰元素输出角色，近距离积攒构造能量后，可蓄力连续打出远程高额伤害，必杀技会进入骑乘模式，造成大量伤害'
  },
  {
    id: '1004',
    name: '人之律者',
    image: '/images/renlv.png',
    text: '凡事任凭心意而为，自由自在，与副首领身份格格不入的少女。亦是逐火英桀的创立者，聚集并维系此十三人的核心人物。只在喜欢的人上花时间，但每个人都很喜欢；只在有趣的事上花心思，但每件事都很有趣——心怀如此信念，带着真诚与热情拥抱每一天的纯真女孩'
  },
  {
    id: '1005',
    name: '洛天依',
    image: '/images/TianYi.png}',
    text: '天依作为首个中文虚拟歌手，为中国虚拟IP技术奠基了发展方向以及创作内容，作为中国第一位虚拟歌手，她有着可爱甜美的少女形象，加上治愈的声音和极具感染力的舞姿，颇受年轻人的喜爱'
  }]

interface image {
  id: string;
  name: string;
  image: string;
  text: string
}

@Entry
@Component
struct ShowPage {
  @State imgIndex: number = 0;

  build() {
    Column() {
      Image(img[this.imgIndex].image)
        .width('100%')
        .height('100%')
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
      Column() {
        Row()
          .width(70)
          .height(2)
          .backgroundColor('#c9999999')


        Row()
        Swiper() {
          Column() {
            Text(img[this.imgIndex].name)
            Text(img[this.imgIndex].text)
          }
          Column() {
            Text(img[this.imgIndex].name)
            Text(img[this.imgIndex].text)
          }
          Column() {
            Text(img[this.imgIndex].name)
            Text(img[this.imgIndex].text)
          }
          Column() {
            Text(img[this.imgIndex].name)
            Text(img[this.imgIndex].text)
          }
          Column() {
            Text(img[this.imgIndex].name)
            Text(img[this.imgIndex].text)
          }
        }
        .autoPlay(true)
        .onChange((index)=>{
          this.imgIndex=index
        })
        .indicator(Indicator.dot())
        .width('100%')
        .height(150)
        .padding(12)
        Text('跳过')
        Button('下一步')
          .width('80%')
          .margin({top:12})
      }
      .width('100%')
      .height('35%')
      .backgroundColor('#fff')
      .position({
        bottom: 0
      })
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
      .borderRadius({
        topLeft: 20,
        topRight: 20
      })
      .padding(12)
    }
    .height('100%')
    .width('100%')
  }
}