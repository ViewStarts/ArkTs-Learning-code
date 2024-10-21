import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { router, window } from '@kit.ArkUI';


export default class EntryAbility extends UIAbility {

  _actionPagge:string='pages/Index' // 自定义的接收参数，用来判断跳转到哪一个页面

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    if(want.parameters&&want.parameters.action){
      let action = want.parameters.action as string
      if(action=='pay'){
        this._actionPagge='pages/PayPage'
      }
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');



    windowStage.loadContent(this._actionPagge, (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  // 冷启动，就是我们的app还没有在运行
  // 唤醒的时候会执行创建到挂载展示页面的整个过程

  //
  // newWant，当我们的应用已经启动，但是不在前台的时候，我们唤醒这个app的时候，会进入这个钩子函数
  // 应用不再执行创建的生命周期钩子函数，此为热启动
  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log('---new want--- 热启动')
    if (want.parameters && want.parameters.action) {
      let action = want.parameters.action as string
      if(action=='pay'){
        this._actionPagge='pages/PayPage'
        router.pushUrl({
          url:this._actionPagge
        })
      }
    }
  }
}














