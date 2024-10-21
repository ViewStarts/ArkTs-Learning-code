import rcp from '@hms.collaboration.rcp';

//拦截器
class  MyInterceptor implements rcp.Interceptor{
  intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    // context 表示请求的上下文
    // next 表示响应
    const url = context.request.url.href;

    //!存在的目的就是强制转换，默认我们的数据是存在的
    context.request.headers!['token']='123' //为网络请求设置请求头

    const promise = next.handle(context); // 获取服务器端的响应结果
    // promise.then((resp) => {
    //   resp.statusCode;
    // });
    return promise;
  }
}

export  class HttpRequest{
  static rcpSession(){
    const session= rcp.createSession({
      baseAddress:'http://172.27.176.1',//网络请求基础地址

      // 网络请求拦截器
      interceptors:[new MyInterceptor()], //网络请求实例化

      // 请求的配置信息
      requestConfiguration:{
        transfer:{
          //超时时间
          timeout:{
            connectMs:5000, //允许建立连接的最长时间，默认是一分钟
            transferMs:5000 //允许传输数据的最长时间，默认是一分钟
          }
        }
      }
    })
    return session;
  }

  static get(url:string){
    return HttpRequest.rcpSession().get(url)
  }

  static post(url:string,data:object){
    return HttpRequest.rcpSession().post(url,data)
  }

  static put(url:string,data:object){
    return HttpRequest.rcpSession().put(url,data)
  }

  static del(url:string){
    return HttpRequest.rcpSession().delete(url)
  }

}