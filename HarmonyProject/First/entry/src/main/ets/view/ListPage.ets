import promptAction from '@ohos.promptAction';

// interface
//  只是用来表达数据类型，不需要额外的操作的时候
interface Goods {
  name: string;
  id: string;
  price: number;
  img?: string; // 加?表示此属性是可选的
}

// class
//   不仅仅是用来表达数据类型，可能还需要额外的操作的时候
@Observed
class Cart {
  id: string; // 购物车的id
  amount: number; // 商品的数量
  product: Goods; // 商品信息

  constructor( amount: number, product: Goods) {
    this.id = "D"+ Date.now()+Math.random()*9999
    this.amount = amount
    this.product = product
  }

  add() {
    this.amount++
  }

  rec(){
    this.amount--
  }
}

@Component
struct CartItemView {
  @ObjectLink item: Cart
  build() {
    Column(){
      Text(`${this.item.product.name}【${this.item.product.price}元】`)
      // 一个数量增加减少的组件
      Counter(){
        Text(this.item.amount+"")
      }.onInc(()=>{ // 点击+的时候执行
          this.item.add()
      }).onDec(()=>{ // 点击-的时候执行
        this.item.rec()
      })
    }
  }
}

@Entry
@Component
struct ListPage {
  @State message: string = 'Hello World';
  @State listData: string[] = ['A', 'B', 'C', 'D']
  @State goodsList: Goods[] = []
  @State cartsList: Cart[] = [] // 购物车数组

  build() {
    Column() {
      Column() {
        ForEach(this.cartsList, (item: Cart) => {
          CartItemView({
            item: item
          })
        }, (item: Cart) => item.id)
      }
      .backgroundColor("#ccc")
      .padding(16)
      Divider()
      ForEach(this.goodsList, (item:Goods) => {
        Row(){
          Text(item.name+'【'+item.price+'】')
          Blank()
          Button("购买")
            .onClick(()=>{
              // findIndex 根据跳转查找对应的数据的索引
              // 没有找到，返回-1
              const tmpIndex = this.cartsList.findIndex(a=>a.product.id == item.id)
              if(tmpIndex>-1) {
                // 商品已经存在了
                this.cartsList[tmpIndex].amount++
              } else {
                // 商品不存在
                this.cartsList.push(
                  new Cart(1, {
                    id: item.id,
                    name: item.name,
                    price: item.price,
                    img: item.img
                  })
                )
              }

            })
        }.width('100%')

      }, (item: Goods) => item.id)
      Button("插入数据到商品数组")
        .onClick(() => {
          this.goodsList.push(({
            id: "D" + Date.now() + Math.random() * 99999,
            name: '商品-' + this.goodsList.length,
            price: Math.floor(Math.random() * 999),
            img: ''
          }))
        })
      // $$xxx实现内置组件和state数据的双向绑定
      TextInput({
        placeholder: '请输入内容',
        text: $$this.message
      }).onSubmit(() => {
        if (this.message) {
          this.listData.push(this.message)
          //
          this.message = ''
        } else {
          // 弹出一个轻提示
          promptAction.showToast({
            message: '请输入内容'
          })
        }
      })
      // ForEach循环生成数据
      ForEach(this.listData, (item: string) => {
        Text(item)
          .fontColor(item == 'A' ? "#f00" : '')
      }, (item: string) => item)
    }
    .height('100%')
    .width('100%')
  }
}