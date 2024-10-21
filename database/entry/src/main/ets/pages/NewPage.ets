import { RODTools } from '../utils/db';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct NewPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      TextInput({
        placeholder: '请输入真名'
      })
      Row() {
        Text('性别')
          .onClick(() => {
            TextPickerDialog.show({
              range: ['男', '女'],
              canLoop: false
            })
          })
      }

      Row() {
        Text('属性:')
          .onClick(() => {
            TextPickerDialog.show({
              range: ['风', '岩', '雷', '草', '水', '火', '冰',],
              canLoop: false
            })
          })
      }
        TextInput({
          placeholder: '请输入昵称'
        })
        TextArea({
          placeholder: '请输入履历'
        })
        Button('确定')
          .onClick(()=>{
          // 通过sql语句插入数据
            RODTools.getInstance().executeSql('这里放插入的sql语句，通过模板字符串')
              .then(res=>{
                promptAction.showToast({
                  message:'新增数据成功'
                })
              })
          })

    }.height('100%')
    .width('100%')
  }
}