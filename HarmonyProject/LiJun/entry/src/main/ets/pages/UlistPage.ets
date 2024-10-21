@Entry
@Component
struct UlistPage {
  @Builder //装饰器
  itemHeader(text: string) {
    Column() {
      Text(text)
        .fontSize(24)
    }
    .backgroundColor('#999')
    .padding(14)

  }

  @Builder
  delBuilder(text:string) {
    Column() {
      Button(text)
      Button(text)
    }

  }

  build() {
    Column() {
      List({
        space: 6 //这个是ListItemGroup分组之间的间距
      }) {
        ListItem() {
          Row() {
            Text('王者荣耀')
            Blank() //撑开
            Button('点一下')
          }.width('100%')
        }

        //分组1
        ListItemGroup({
          header: this.itemHeader('我想她了'),
          space: 6
        }) {
          ListItem() {
            Column() {
              Text('火影忍者')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#993333')
          }.swipeAction({
            //滑动行为，加了就可以滑动
            end: this.delBuilder('火影忍者'), //右滑
            start: this.delBuilder('火影忍者') //左滑
          })

          ListItem() {
            Column() {
              Text('诸葛亮')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#993333')
          }

          ListItem() {
            Column() {
              Text('香格里拉')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#993333')
          }

          ListItem() {
            Column() {
              Text('孔明')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#993333')
          }

          ListItem() {
            Column() {
              Text('Java')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#993333')
          }
          .swipeAction({
            //滑动行为，加了就可以滑动
            end: this.delBuilder('Java是最好的语言'), //右滑
            start: this.delBuilder('Java是最好的语言') //左滑
          })
        }

        //分组2
        ListItemGroup({
          header: this.itemHeader('下面都是最好的语言')
        }) {
          ListItem() {
            Column() {
              Text('c#是最好的语言')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#339999')
          }

          ListItem() {
            Column() {
              Text('python是最好的语言')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#339999')
          }

          ListItem() {
            Column() {
              Text('php才是最好的语言')
                .fontSize('#fff')
            }
            .height(200)
            .width('100%')
            .backgroundColor('#339999')
          }

        }

      }
      .sticky(StickyStyle.Header) //使分组有吸顶效果
    }
    .height('100%')
    .width('100%')
  }
}