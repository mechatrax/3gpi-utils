3gpi-utils
==========

3GPIを操作するためのツール類を提供します。

## 提供ファイル
以下のファイルがパッケージに含まれています。

* /etc/cron.d/3gpi-utils  
  3GPIの電源監視を行うためのファイルです。  
  5分おきに実行するように設定されています。

* /etc/default/3gpi-utils  
  3GPIの動作設定を行うためのファイルです。  
  設定可能な項目を以下に示します。  
  
  + AUTO_ON  
    Raspberry Pi 起動時の3GPIの動作を設定します。  
    デフォルトでは 1 です。  
    
    1 : 3GPIを起動します。  
    0 : 3GPIの操作は行いません。  
    
  + KEEP_ON  
    3GPIの電源監視を設定します。  
    1 に設定するには AUTO_ON=1 にする必要があります。  
    デフォルトでは 0 です。  
    
    1 : 3GPIを起動状態に保ちます。  
    0 : 3GPIの電源状態は監視しません。  
    
  + AUTO_GPS  
    Raspberry Pi 起動時のGPSの動作を設定します。  
    1 に設定するには AUTO_ON=1 にする必要があります。  
    デフォルトでは 0 です。  
    
    1 : GPSを有効にします。  
    0 : GPSの操作は行いません。  

* /usr/share/doc/3gpi-utils/changelog.Debian.gz  
  パッケージの変更履歴が記録されているファイルです。  

* /usr/sbin/3gpictl  
  3GPIの操作を行うための実行ファイルです。  
  使用可能なオプションを以下に示します。  
  
  –poweron : 電源をオンします。  
  –poweroff : 電源をオフします。  
  –reset : 電源をリセットします。  
  –status : 電源状態を表示します。  
  –gpson : GPSを有効にします。  
  –gpsoff : GPSを無効にします。  
  –version, -v : バージョンを表示します。  
  –help, -h : ヘルプを表示します。  

* /lib/udev/rules.d/70-3gpi-usbserial.rules  
  3GPIのデバイスを定義した設定ファイルです。  

* /lib/systemd/system/3gpi-utils.service  
  3GPIのサービスを稼働させるための設定ファイルです。  

