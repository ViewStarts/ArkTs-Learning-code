class JiaDian{
  id:string;
  name:string;
  status:number; //0 正常，1坏了

  constructor(name:string) {
    this.id=Math.ceil(Date.now()+Math.random()*999999)+'';
    this.name=name;
    this.status=0;
  }

  //家电坏了
  huaule(){
    this.status=1
  }

  //家电修好了
  xiuhaole(){
    this.status=0
  }
}


@Entry
@Component
struct AppliancePage {

  build() {
    Column() {

    }
    .height('100%')
    .width('100%')
  }
}