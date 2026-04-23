# アラーム機能仕様

## 画面一覧
- AlarmSetupView   ：アラーム一覧・設定画面（ホーム）
- AlarmActiveView  ：アラーム鳴動中の画面

## AlarmSetupView
- アラーム一覧をリスト表示
- 右上の+ボタンで新規アラーム追加
- 各行にアラーム時刻・ラベル・ON/OFFトグルを表示
- 下部にタブバー（Home・Alert）
- サイレントモードの注意書きを常時表示

## AlarmActiveView
- スワイプパズル画面を表示（5点をつなぐ経路）
- 薄いグレーで経路表示・番号で順番を明示
- 最初の点にタッチした瞬間にアラーム音停止
- 成功：アラーム解除・スコア記録
- 失敗：即座に次の通知をスケジュール登録

## 通知の仕様
- UserNotificationsで指定時刻に通知＋バイブ送信
- 通知アクションボタン「アラームを解除する→」を表示
- アプリ起動後はAVAudioPlayerでアラーム音を再生
- サイレントモードでも鳴動する

## 計測・保存するデータ（AlarmRecord）
- scheduledTime : Date    設定時刻
- stoppedTime   : Date    実際に止めた時刻
- delayMinutes  : Int     ズレ（分）
- snoozeCount   : Int     スヌーズ回数（上限なし）
- date          : Date    記録日

## ズレの計算ロジック
delayMinutes = 止めた時刻 - 設定時刻（分単位）
スヌーズ中に止めた場合も、最初の設定時刻からのズレを記録する
