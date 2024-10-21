import { http } from '@kit.NetworkKit'

export  class HttpRequest{
  // get请求
  //用的时候直接HttpRequest.get(''),静态函数，然后直接.then即可
  static get(url:string){
    return http.createHttp().request(url,{ //return直接返回给get函数
      expectDataType:http.HttpDataType.OBJECT //转换为object类型
    })
  }

  // post请求 用的时候直接HttpRequest.post('',{})
  static post(url:string,data:object){
    return http.createHttp().request(url,{ //return直接返回给get函数
      method:http.RequestMethod.POST, //请求方式改为post请求，内置api
      header:{
        'Content-Type':'application/json' //需要在请求头中设置传输的请求体中的数据的数据类型
      },
      extraData:data, //传递的数据
      expectDataType:http.HttpDataType.OBJECT //转换为object类型
    })
  }
}