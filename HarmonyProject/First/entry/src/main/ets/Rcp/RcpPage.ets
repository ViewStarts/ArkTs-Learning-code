import rcp from '@hms.collaboration.rcp'
import { HttpRequest } from '../utils/http-request';

//接口，定义一个接口,接口只是定义了数据类型以及一些函数名字
interface IPerson {
  name: string; //属性
  age: string; //属性
  say: (msg: string) => void //函数，方法
  zuo: () => string //方法
}

//接口实现，类的作用是实现这个接口的具体内容 implements
class Person implements IPerson {
  name: string;
  age: string;

  constructor(name: string, age: string) {
    this.name = name;
    this.age = age;
  }

  say(meg: string) {

  }

  zuo() {
    return ''
  }
}

//继承，他会默认继承父类里的say,zuo方法，以及name和age属性
class SunZi extends Person{
  constructor(name:string,age:string) {
    super(name,age)
  }
}


interface Goods {
  id: string;
  name: string;
  coverImage: string;
  price: number;
}

interface uName {
  userName: string;
  password: string;
}


// implements 实现接口
class MyInterceptor implements rcp.Interceptor {
  intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    // context 表示请求的上下文
    // next 表示响应
    const url = context.request.url.href;

    //!存在的目的就是强制转换，默认我们的数据是存在的
    context.request.headers!['token'] = '123' //为网络请求设置请求头

    const promise = next.handle(context); // 获取服务器端的响应结果
    // promise.then((resp) => {
    //   resp.statusCode;
    // });
    return promise;
  }
}

@Entry
@Component
struct RcpPage {
  // rcp远场通信协议 也是用来发起网络请求的
  testRequest() {
    const session = rcp.createSession({
      baseAddress: 'http://172.27.176.1', //网络请求基础地址

      // 网络请求拦截器
      interceptors: [new MyInterceptor()], //网络请求实例化

      // 请求的配置信息
      requestConfiguration: {
        transfer: {
          //超时时间
          timeout: {
            connectMs: 5000, //允许建立连接的最长时间，默认是一分钟
            transferMs: 5000 //允许传输数据的最长时间，默认是一分钟
          }
        }
      }
    })
    session.get('/api/v1/produvts',)
      .then(res => {
        const list = res.toJSON()!['data'] as Goods[] //res.toJSON可能不存在，可能为null，加感叹号表示一定存在是一个对象
        console.log(list.length + '')
      })
    // session.post()
    // session.put()
    // session.delete()
  }

  testLogin(){
    // HttpRequest.get('').then(res=>{
    //
    // })

    const obj:uName={
      userName:'张三',
      password:'17231'
    }
    HttpRequest.post('/api/v1/auth/login',obj)
      .then(res=>{
        console.log(JSON.stringify(res.toJSON()))
      })
  }


  // 生命周期钩子函数，初始化的时候直接调用
  aboutToAppear(): void {
    this.testLogin()
  }

  build() {
    Column() {

    }
    .height('100%')
    .width('100%')
  }
}