import { restoreMyDb } from '../utils/db';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct SettingPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
   Button('下载数据')
     .onClick(()=>{
       restoreMyDb(getContext() as common.UIAbilityContext)
     })
    }
    .height('100%')
    .width('100%')
  }
}