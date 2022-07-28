# CHIKAGE

##chikageについて<br>
DWC 3ヶ月目の課題のポートフォリオを制作しました。<br>
アプリ名は"chikage"(千景です)<br>
<br>
*テーマは雑誌に載らないような自分だけの景色をシェアするサイトです*<br>

今回作成にあたって一番実装したかった機能がgoogle api を使ったmap機能の追加です<br>
普通、観光地を調べるときにはいちいち、住所を打って見ますよね？<br>
そのまま周辺の観光地を調べると、前に調べたピンを固定していなければ、位置情報を比較することはできません。<br>
さらに、雑誌が紹介する観光地には偏りがあり、人気で数字の取れるようなところしか紹介できないと思うことがなんどかありました。<br>
その点chikageであれば会社ではなく、個人が投稿するため、よりマイナーな情報も得ることが可能になります。<br>
利用者の旅をより充実させることができると思います。<br>


##URL<br>
http://18.180.162.2/public/top　　<br>
(chikageのtop画面に遷移できます)　　<br>
　　<br>
##使い方について　　<br>
*管理者ログインについて　　<br>
①url に　**admins/sign_in**と記入してください　　<br>
②メールアドレスは** chikage@admin.com **　　<br>
③パスワードは **chikage** と記入してください　　<br>
④ログインボタンを押してください　　<br>
　　<br>
*ユーザーログインについて　　<br>
①url に　*users/sign_in**と記入してください　　<br>
②メールアドレスは** chikage@guest.com **　　<br>
③パスワードは **chikage** と記入してください　　<br>
④ログインボタンを押してください　　<br>
*(このユーザはゲストユーザーのため、機能が制限されています)*　　<br>
　　<br>
*ユーザーのサインアップについて　　<br>
①url に　*users/sign_up**と記入してください　　<br>
②記入項目に従ってフォームをご記入ください　　<br>
④サインアップボタンを押してください　　<br>
　　<br>
##chikageについての詳細な説明　　<br>
#管理者側について　　<br>
*ユーザ情報編集　　<br>
編集に関しては管理者アカウントでログインしていただき**admin/user/:id**に遷移してください　　<br>
1, ユーザのランクの編集　　　<br>
2, ユーザの有効/凍結の編集<br>　　
3, 管理者コメント　　<br>
以上の３種類を管理者権限で編集することができます。　　<br>
　　<br>
*投稿の設定　　<br>
1, 投稿の公開非公開の設定　　<br>
2, 投稿に関連したコメントの削除機能　　　　<br>
　　<br>
*その他の管理者の機能　　<br>
投稿についての詳細情報　　<br>
　　<br>
#会員側について　　<br>
*会員機能にについて　　<br>
1, 他の会員のフォローができます　　<br>
2, フォロしてくれている人、フォローしている人の一覧が見れます　　<br>
3, 他のユーザの検索機能があります（部分検索機能なので、一部でも引っかかっていれば検索できます）　　<br>
4, プロフィールにもいくつかの情報をアップできます（プロフ画像、自己紹介文）　　<br>
5, ユーザーの詳細ページにはロケーションリポートにログイン中のユーザがいいねした投稿の一覧が見れます　　<br>
　　<br>
*投稿機能について　　<br>
1, ログインしているユーザのみ、新規の投稿をすることができます　　<br>
2, 投稿にはタイトル、本文、イベント名、住所、日付、画像を投稿することができます　　<br>
3, 座標を入力することなく、住所だけで地図上にピンを反映することができます　　<br>
4, 投稿されたものにユーザはいいね、いったよ、コメントを残すことができます　　<br>
5, いいねはその投稿がいいと思ったさいにつける機能です　　<br>
6, いったよは、実際に訪れたことがある人がつけることができます　　<br>
7, コメントを残すことができます　　<br>
8, コメントはコメントの投稿者と管理者のみが削除できます　　<br>
<br>
*編集について　　<br>
1, 投稿者のみが投稿を編集することができます　　<br>
2, 投稿者以外が編集ページに入ると制限ページが表示されます　　<br>
3, 編集については投稿と同じ要領で行うことができます　　<br>
　　<br>
*詳細ページについて　　<br>
1, 投稿詳細ページから編集、消去を選択することができます　　<br>
2, 編集、削除リンクは投稿者のみ表示されます　　<br>
　　<br>
##使用した言語について　　<br>
#開発はAWSのcloud9で行いました。　　<br>
#rails のバージョンは　Rails 6.1.6　を使用しています　　<br>
（そのほかにhtml、css、一部地図の表示のためにjavascriptを使用しています）　　<br>
<br>
##実装した機能<br>
*ユーザのログイン・サインアップ機能<br>
*管理者ログイン機能<br>
*ゲストログイン機能<br>
*管理者管理者権限による投稿・コメント管理機能<br>
*ユーザのフォロー機能<br>
*投稿に対してログインユーザからのアクション（いいね・いったよ・コメント）<br>
*ユーザーがいいねした投稿の一覧機能　<br>
*キーワード検索機能（投稿・ユーザ）およびタグ検索機能（投稿）<br>
*投稿情報から地図表示およびピンを表示する機能<br>

