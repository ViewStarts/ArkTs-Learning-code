import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

// 三种模式
// 单例模式，默认的，一次启动一个uiability
// 多例模式，可以通过设置，让我们的app具备多个uiability
// 指定ability模式，指定启动的uiability

export default class EntryAbility extends UIAbility {
  // 创建的时候执行
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    want.parameters // 获取上一个app传递过来的参数，根据参数我们就可以做相应的操作
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  //销毁的时候执行
  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  // WindowStage创建之后执行
  // WindowStage相当于一个容器，这个容器是用来展示我们的ui组件的
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{publice}s', 'Ability onWindowStageCreate');

    // eventHub是事件监听的意思
    // 可以实现页面组件和Ability之间的数据通信
    this.context.eventHub.on("bbbb",(a:string)=>{
      console.log("a的值为:"+a)
    })

    // 加载一个页面进行显示
    // 第一个参数表示我们加载的初始化页面的地址
    windowStage.loadContent('pages/DownLoadPage', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });

    //这里可以监听windowStage的各种事件，比如windowStageEvent
    //windowStageEvent可以监听windowStage的改变事件，我们通过类型值获取对应的状态信息
    // https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/uiability-lifecycle-V5
    // windowStage生命周期相关内容
    windowStage.on("windowStageEvent",(e)=>{
      // window.WindowStageEventType，可以获取对应的事件类型
      // window.WindowStageEventType.SHOWN
      if( window.WindowStageEventType.ACTIVE==e){ //.ACTIVE获取焦点
        console.log('页面获取到焦点');
      }
      if( window.WindowStageEventType.INACTIVE==e){ //.INACTIVE失去焦点
        console.log('页面失去焦点');
      }
      // console.log(e.toString())
    })
  }

  // WindowStage销毁的时候执行
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  // 应用切换到前台的时候执行
  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  // 应用切换到后台的时候执行
  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

// 生命周期顺序 onCreate onWindowStageCreate  windowStage  onForeground
