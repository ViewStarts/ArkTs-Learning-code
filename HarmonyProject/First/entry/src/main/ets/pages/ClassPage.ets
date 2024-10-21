@Observed //1.如果我们需要监听复杂数据类型的改变，需要为他使用Observed 装饰器
class MyPerson {
  id: string;
  name: string;
  desc: string;
  age: number;

  constructor(name: string, desc: string, age: number = 18) { //构造函数，需要三个参数
    this.id = "D" + Date.now() + Math.random() * 999999; //让id是唯一的，不重复的
    this.name = name;
    this.desc = desc;
    this.age = age;
  }
}

//如果想改变一个复杂数据类型的话，需要通过组件的形式
@Component
struct PersonView{
  //2.@ObjectLink用来监听一个复杂数据类型的改变
  @ObjectLink person:MyPerson
  //定义一个删除函数
  del:(id:string)=>void=(id:string)=>{}
  build() {
    Column() {
      Text(this.person.name)
      Text(this.person.desc)
      Button(this.person.age + '岁')
        .onClick(()=>{
          this.person.age+=1
        })
      Button('删除')
        .onClick(()=>{
          //findIndex数组方法，找到对应数据的索引，如果当前数据的索引和下标数据的索引id一致，就会删除
          // this.people.splice(this.people.findIndex(Uitem=>Uitem.id==this.person.id),1)
        this.del(this.person.id)
        })
    }
    .margin(12)
    .backgroundColor('#ccc')
    .width('100%')
  }
}

@Entry
@Component
struct ClassPage {
  @State people: MyPerson[] = [//people是由MyPerson组成的数组
    new MyPerson('五河琴里', '她有一个红色的双马尾', 18),
    new MyPerson('时崎狂三', '她的武器叫刻刻帝', 23),
    new MyPerson('夜刀神十香', '她有一个翻转的形态', 16),
  ]

  build() {
    Scroll(){
      Column() {
        ForEach(this.people, (person: MyPerson) => {
          PersonView({ //组件
            person:person,
            del:(id:string)=>{
              this.people.splice(this.people.findIndex(item=>item.id==person.id),1)
            }
          })
        }, (item: MyPerson) => item.id)
        Button('新增')
          .onClick(() => {
            this.people.push(new MyPerson('鸢一折纸', '她的外号叫折纸大师', Math.ceil(Math.random() * 120)))
          })
      }
      }
  }
}