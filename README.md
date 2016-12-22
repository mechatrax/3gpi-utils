3gpi-utils
==========

3GPi を操作するためのツール類を提供します。  

## 提供ファイル
以下のファイルがパッケージに含まれています。  

* /etc/default/3gpi-utils  
  3GPi の動作設定を行うためのファイルです。  
  設定可能な項目を以下に示します。  
  
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
    3GPi 基板上のジャンパピンで GPIO27 と GPIO16 を選択できます。  
    空白の場合は無効になります。  
    デフォルトは 27 です。  
    
  + TIMEOUT  
    3GPi の電源状態の検出時間を設定します。  
    単位は秒です。  
    デフォルトでは 10 です。  
    
  + AUTO_ON  
    Raspberry Pi ブート時の 3GPi の動作を設定します。  
    デフォルトでは 1 です。  
    
    1 : 3GPi の通信モジュールの電源をオンにします。  
    0 : 3GPi の操作は行いません。  
    
  + AUTO_OFF  
    Raspberry Pi シャットダウン時の 3GPi の動作を設定します。  
    デフォルトでは 1 です。  
    
    1 : 3GPi の通信モジュールの電源をオフにします。  
    0 : 3GPi の操作は行いません。  
    
  + AUTO_RESET  
    Raspberry Pi シャットダウン時の 3GPi の動作を設定します。  
    1 に設定するには AUTO_OFF=0 にする必要があります。  
    デフォルトでは 1 です。  
    
    1 : 3GPi の通信モジュールの電源をリセットします。  
    0 : 3GPi の操作は行いません。  
    
  + AUTO_GPS  
    Raspberry Pi 起動時の GPS の動作を設定します。  
    1 に設定するには AUTO_ON=1 にする必要があります。  
    デフォルトでは 0 です。  
    
    1 : GPS を有効にします。  
    0 : GPS の操作は行いません。  

* /etc/modules-load.d/3gpi.conf  
  3GPi に必要なカーネルモジュールを記述したファイルです。  

* /usr/share/doc/3gpi-utils/changelog.Debian.gz  
  パッケージの変更履歴を記録したファイルです。  

* /usr/share/doc/3gpi-utils/copyright  
  ソースの著作権とライセンスを記載したファイルです。  

* /usr/sbin/3gpictl  
  3GPi の操作を行うための実行ファイルです。  
  使用可能なオプションを以下に示します。  
  
  --poweron : 電源をオンします。  
  --poweroff : 電源をオフします。  
  --reset : 電源をリセットします。  
  --status : 電源状態を表示します。  
  --gpson : GPS を有効にします。  
  --gpsoff : GPS を無効にします。  
  --version, -v : バージョンを表示します。  
  --help, -h : ヘルプを表示します。  

* /usr/lib/3gpi-utils/export.sh  
  3GPi で使用する GPIO ポートを初期化する実行ファイルです。  

* /usr/lib/3gpi-utils/start.sh  
  3GPi の起動処理を行う実行ファイルです。  

* /usr/lib/3gpi-utils/stop.sh  
  3GPi の終了処理を行う実行ファイルです。  

* /usr/lib/3gpi-utils/unexport.sh  
  3GPi で使用する GPIO ポートを開放する実行ファイルです。  

* /lib/udev/rules.d/70-3gpi-usbserial.rules  
  3GPi のデバイスを定義した設定ファイルです。  

* /lib/systemd/system/3gpi-utils.service  
  3GPi のサービスを稼働させるための設定ファイルです。  

