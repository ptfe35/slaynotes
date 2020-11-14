# slaynotes

## サイト概要
WEB上で自分のノートを作成し、他の人と共有できるサイト。  

例えばプログラミングの勉強をしている時、  
様々なサイトの情報を、本サイト上で１つのノートとして集約することができる。  

ー 以下、機能説明 ー  

* ユーザは、文章を投稿することができる。  

* ユーザは、文章を投稿する際に「ノート」「ページ」の名前を設定する。  
  これにより、投稿した文章を目次で管理することができる。  

 （以下、具体例）  
　ノート：Rails  
　ページ：フォーム画面  
と名前をつけることで、目次画面では  
- Rails
  - フォーム画面
  
と階層的に表示される。  

* ユーザは、投稿した記事を自由に再編集できる。  

* 投稿時は、参考サイトの記載内容をコピーして貼り付ける運用が想定されるため、  
  著作権等の権利保護として参考URLを記述する必要がある。  

* ユーザは、他ユーザをフォローすることができる。  

* ユーザは、他ユーザの記事にコメントを付加することができる。  

* ユーザは、他ユーザの記事に[いいね]を付加することができる。  

### サイトテーマ
知識の結晶である「ノート」を、全世界の人と共有する。  

### テーマを選んだ理由
筆者が実際に欲しいと感じたWEBアプリをテーマとしている。  

筆者がプログラミングをしていて詰まった際は、  
参考書を読む他に、参考サイトやQ&Aサイトを見ることが多い。  
初めはブラウザのブックマーク機能でそれら各ページを保存していたが、  
それも数が膨大になっていくにつれ、管理が面倒と感じるようになった。  

また、参考サイトやQ&Aサイトを見るに際して  
 * 記載内容に誤りのあることがある
 * 自分の開発環境と異なることがある
 * (自分にとって)不要な記述がある
 * (自分にとって)情報が体系化されていない  
といった問題点がある。  

よって、最近はもっぱら参考サイトの内容をノートアプリにコピーして貼り付け、  
自分用に記載内容を編集する、といった作業を行なっている。  

そこで、もし同じような状況の人が筆者以外にもいることを考えると、  
皆が個別に作成しているこの「電子ノート」を全世界で共有できるようにするのも面白いのではないかと考えた。  

他の人が作った電子ノートを、自分が必要な分だけコピーし、また自分に必要な内容に編集できるアプリがあれば、  
各個人の学習の効率化に寄与でき、ひいては全世界の知識水準を上げることもできるのではないだろうか。  


### ターゲットユーザ
* プログラミングスクールに通っている方。
* 資格勉強中の方。
* 受験生の方。
* 生涯学習を続ける方。

### 主な利用シーン
パソコンやスマホを使った学習。  
自宅や、公共交通機関での移動中に利用することを想定。  

## 設計書

### 機能一覧
https://docs.google.com/spreadsheets/d/15W_pyAHopFmJeAp58sPY377nUpD7GT10L_hNzvg8B5I/edit?usp=sharing

## 開発環境
- OS：macOS Catalina
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- 仮想環境：Vagrant,VirtualBox
