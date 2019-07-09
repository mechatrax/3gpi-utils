3gpi-utils
==========

3GPi を操作するためのツール類を提供します。

## 提供ファイル
次のファイルがパッケージに含まれています。

### /etc/default/3gpi-utils  
3GPi の動作設定を行うためのファイルです。  
設定可能な項目を次に示します。

+ CONSOLE_PORT  
  3GPi で AT コマンドを実行する際に使用するポートを設定します。  
  デフォルトは /dev/tty3GPI です。

+ RI_PIN  
  3GPi の着信通知に使用する GPIO のピン番号を指定します。  
  3GPi 基板上のジャンパピンで GPIO16 と GPIO18 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは無効です。

+ POWER_PIN  
  3GPi の電源操作に使用する GPIO のピン番号を指定します。  
  3GPi 基板上のジャンパピンで GPIO17 と GPIO12 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは 17 です。

+ STATUS_PIN  
  3GPi の電源状態取得に使用する GPIO のピン番号を指定します。  
  3GPi 基板上のジャンパピンで GPIO22 と GPIO13 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは 22 です。

+ RESET_PIN  
  3GPi のリセット操作に使用する GPIO のピン番号を指定します。  
  3GPi 基板上のジャンパピンで GPIO27 と GPIO6 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは 27 です。

+ TIMEOUT  
  3GPi の電源状態の検出時間を設定します。  
  単位は秒です。  
  デフォルトは 10 です。

+ AUTO_ON  
  Raspberry Pi ブート時の 3GPi の動作を設定します。  
  デフォルトは 1 です。

  1 : 3GPi の通信モジュールの電源をオンにします。  
  0 : 3GPi の操作は行いません。

+ AUTO_OFF  
  Raspberry Pi シャットダウン時の 3GPi の動作を設定します。  
  デフォルトは 1 です。

  1 : 3GPi の通信モジュールの電源をオフにします。  
  0 : 3GPi の操作は行いません。

+ AUTO_RESET  
  Raspberry Pi シャットダウン時の 3GPi の動作を設定します。  
  有効にするには AUTO_OFF=0 である必要があります。  
  デフォルトは 0 です。

  1 : 3GPi の通信モジュールの電源をリセットします。  
  0 : 3GPi の操作は行いません。

+ AUTO_GPS  
  Raspberry Pi 起動時の GPS の動作を設定します。  
  有効にするには AUTO_ON=1 である必要があります。  
  デフォルトは 0 です。

  1 : GPS を有効にします。  
  0 : GPS の操作は行いません。

+ WAKE_ON_RING  
  待機中に着信があった場合 RI 信号を出力します。  
  有効にするには AUTO_OFF=0 である必要があります。  
  デフォルトは 0 です。

+ STORE_SMS_ON_RING  
  待機中に SMS の着信があった場合に本文を保存します。  
  有効にするには WAKE_ON_RING=1 である必要があります。  
  デフォルトは 0 です。  
  **SORACOM グローバル向け Air SIM を使用する場合は 0 に設定してください。**

### /etc/modules-load.d/3gpi.conf  
3GPi に必要なカーネルモジュールを記述したファイルです。

### /usr/sbin/3gpictl  
3GPi の操作を行うための実行ファイルです。  
使用可能なオプションを次に示します。

--poweron : 電源をオンします。  
--poweroff : 電源をオフします。  
--reset : 電源をリセットします。  
--status : 電源状態を表示します。  
--riclear : RI をクリアします。  
--rienable : RI を有効にします。  
--gpson : GPS を有効にします。  
--gpsoff : GPS を無効にします。  
--version, -v : バージョンを表示します。  
--help, -h : ヘルプを表示します。

### /usr/lib/3gpi-utils/gpio-export.sh  
3GPi で使用する GPIO ポートを初期化する実行ファイルです。

### /usr/lib/3gpi-utils/gpio-unexport.sh  
3GPi で使用する GPIO ポートを開放する実行ファイルです。

### /usr/lib/3gpi-utils/modem-init.sh  
3GPi のモデム初期化を行う実行ファイルです。

### /usr/lib/3gpi-utils/start.sh  
3GPi の起動処理を行う実行ファイルです。

### /usr/lib/3gpi-utils/stop.sh  
3GPi の終了処理を行う実行ファイルです。

### /usr/lib/3gpi-utils/chatscripts/gps-off  
GPS の動作を無効にする AT コマンドを発行します。

### /usr/lib/3gpi-utils/chatscripts/gps-on  
GPS の動作を有効にする AT コマンドを発行します。

### /usr/lib/3gpi-utils/chatscripts/ri-clear  
RI 信号をクリアする AT コマンドを発行します。

### /usr/lib/3gpi-utils/chatscripts/ri-enable-me  
待機中の RI 信号の出力を有効にする AT コマンドを発行します。  
着信時に受信した SMS の本文は保存します。

### /usr/lib/3gpi-utils/chatscripts/ri-enable-sm  
待機中の RI 信号の出力を有効にする AT コマンドを発行します。  
着信時に受信した SMS の本文は廃棄します。

### /lib/udev/rules.d/70-3gpi-usbserial.rules  
3GPi のデバイスを定義した設定ファイルです。

### /lib/systemd/system/3gpi-modem-init.service  
3GPi のモデム初期化サービスの設定ファイルです。

### /lib/systemd/system/3gpi-utils.service  
3GPi のサービスの設定ファイルです。

### /usr/share/bash-completion/completions/3gpictl
3gpictl のコマンド補完を行うための設定ファイルです。

### /usr/share/doc/3gpi-utils/changelog.gz
パッケージの変更履歴を記録したファイルです。

### /usr/share/doc/3gpi-utils/copyright
著作権とライセンスを記載したファイルです。
