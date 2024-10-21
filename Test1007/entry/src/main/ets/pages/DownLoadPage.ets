import { request, zlib } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs'; //引入fs模块，读取路径
import { image } from '@kit.ImageKit';

/**
 * 从远程下载文件
 * @param context        上下文
 * @param url            文件地址
 * @param fileSavePath   保存的路径地址
 * @param cb             回调函数
 */
function loadFileFromServer(context: common.UIAbilityContext, url: string, fileSavePath: string, cb: () => void) {
  // let savePath = context.cacheDir + "/bb2221.jpg" //缓存目录,起了个名字叫bb.jpg，下载的文件会存储到这个文件中  ~地址+文件名~
  console.log("文件存储路径为:" + fileSavePath) //下载下来的文件是二进制，没有文件名，所以上面必须要命名，这里命名为bb.jpg
  //这是一个下载任务
  request.downloadFile(context, {
    //第一个参数是上下文，第二个参数是配置项
    url, //下载文件的地址
    filePath: fileSavePath, //下载后存储的路径
  }).then(res => {
    //on是一个监听事件，complete表示监听完成的结果
    res.on('complete', () => {
      console.log('下载完成')
      cb() //下载完成之后调用回调函数，通知外部我已经下载完成了
    })
    //on是一个监听事件，progress表示监听下载的进度
    res.on('progress', (receivedSize, totalSize) => { //r表示下载进度中我们已经接受的数量，t表示文件的总数量
      console.log(`下载中:${receivedSize}/${totalSize}`)
    })
  })
}

@Entry
@Component
struct DownLoadPage {
  @State message: string = 'Hello World';
  @State imgSrc: string = ''
  @State lijun: image.PixelMap | undefined = undefined
  @State imageList: image.PixelMap[] = []

  build() {
    Column() {
      Image(this.lijun)
        .width('80%')
      Button("下载文件")
        .onClick(() => {
          //
          let context = getContext() as common.UIAbilityContext //上下文
          let savePath = context.cacheDir + "/bb2221.jpg" //缓存目录,起了个名字叫bb.jpg，下载的文件会存储到这个文件中  ~地址+文件名~
          console.log("文件存储路径为:" + savePath) //下载下来的文件是二进制，没有文件名，所以上面必须要命名，这里命名为bb.jpg

          //这是一个下载任务
          request.downloadFile(context, {
            //第一个参数是上下文，第二个参数是配置项
            url: "https://avatars.githubusercontent.com/u/95892717?v=4", //下载文件的地址
            filePath: '', //下载后存储的路径
          }).then(res => {
            //on是一个监听事件，complete表示监听完成的结果
            res.on('complete', () => {
              console.log('下载完成')
              console.log(fs.listFileSync(context.cacheDir).toString()) // listFileSync列出文件夹里的内容

              // 此处使用ImageSource对已经下载的图片资源进行处理
              let file = fs.openSync(savePath) //打开文件，获取文件真实的物理路径
              let imageSource = image.createImageSource(file.fd) //创建一个imageSource图片源，以后我们对图片数据的修改或者编辑都是用它
              this.lijun = imageSource.createPixelMapSync()
            })

            //on是一个监听事件，progress表示监听下载的进度
            res.on('progress', (receivedSize, totalSize) => { //r表示下载进度中我们已经接受的数量，t表示文件的总数量
              console.log(`下载中:${receivedSize}/${totalSize}`)
            })


          })
        })

      Button('下载压缩包')
        .onClick(() => {
          // http://192.168.226.1:5500/1.7z
          let context = getContext() as common.UIAbilityContext //上下文
          let savePath = context.cacheDir + '/tmpavatars/' + '111.zip' //下载的路径，保存路径
          fs.rmdirSync(context.cacheDir + '/tmpavatars') //删除下载目录，先删除的目的是为了保证我新下载的文件不报错
          fs.mkdirSync(context.cacheDir + '/tmpavatars') //文件夹不存在，创建下载目录
          loadFileFromServer(context, 'http://192.168.226.1:5500/1.7z', savePath, () => {
            // 下载成功之后会调用这个回调函数
            console.log(fs.listFileSync(context.cacheDir + '/tmpavatars').toString()) //下载成功之后打印一下我的文件名

            let outfiles = context.cacheDir + '/tmpavatars/' + 'outfiles'
            fs.mkdirSync(outfiles) //创建一个解压之后文件的存放位置
            // zlib这个api可以实现解压缩处理
            zlib.decompressFile(savePath, outfiles, (err) => {
              if (err) {
                console.log(err.message)
                return
              }
              console.log('解压缩成功了')
              console.log('解压之后的文件为:' + fs.listFileSync(outfiles).toString())
              fs.listFileSync(outfiles).forEach(item => {
                // 此处使用ImageSource对已经下载的图片资源进行处理
                let file = fs.openSync(outfiles + '/' + item) //打开文件，获取文件真实的物理路径
                let imageSource = image.createImageSource(file.fd) //创建一个imageSource图片源，以后我们对图片数据的修改或者编辑都是用它
                this.imageList?.push(imageSource.createPixelMapSync())
              })
            })


          })
        })
      List() {
        ForEach(this.imageList, (item: image.PixelMap) => {
          ListItem() {
            Image(item)
              .width('80%')
          }
        }, (item: image.PixelMap, index: number) => index + '')
      }.lanes(2)
    }
    .height('100%')
    .width('100%')
  }
}