# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
    email: 'chikage@admin.com',
    password: ENV['ADMIN_PASSWORD']
)

User.create!(
    account_name: 'chikage_guest',
    email: 'chikage@guest.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'ゲストログイン専用のアカウントのため機能が制限されています'
  )

User.create!(
    account_name: 'chikage_admin',
    email: 'chikage@admin.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '会員側管理者ユーザです'
  )

User.create!(
    account_name: 'IamDevelopper',
    email: 'chikage@test1.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '94'
  )

User.create!(
    account_name: 'JasmineTea',
    email: 'chikage@test2.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'さっぱり'
  )

  User.create!(
    account_name: 'KINGofSukiya',
    email: 'chikage@test3.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'キングしか勝たん'
  )

  User.create!(
    account_name: 'HERO',
    email: 'chikage@test4.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '休暇中のヒーローです'
  )

  User.create!(
    account_name: 'daigoro',
    email: 'chikage@test5.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'クマの'
  )

  User.create!(
    account_name: 'solt',
    email: 'chikage@test6.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'しょっぱい'
  )

  User.create!(
    account_name: 'suger',
    email: 'chikage@test7.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '甘いけど辛い'
  )


  User.create!(
    account_name: 'bippa',
    email: 'chikage@test8.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '秘伝要員引退宣言'
  )


  User.create!(
    account_name: 'bee',
    email: 'chikage@test9.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'ビー'
  )


  User.create!(
    account_name: 'Severus',
    email: 'chikage@test10.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'この授業では杖を振ったり馬鹿げた呪文を唱えたりはしない'
  )



  User.create!(
    account_name: 'tomato',
    email: 'chikage@test11.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '生は苦手'
  )



  User.create!(
    account_name: 'summer',
    email: 'chikage@test12.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '今年は暑くない！？！？'
  )



  User.create!(
    account_name: 'chikagechikage',
    email: 'chikage@test13.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '千景は数え切れないほどの景色からとりました'
  )



  User.create!(
    account_name: '3monthes',
    email: 'chikage@test14.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'あっという間の3ヶ月'
  )



  User.create!(
    account_name: 'olive',
    email: 'chikage@test15.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '小さいやつほど高い'
  )


  User.create!(
    account_name: 'asita_yaro',
    email: 'chikage@test16.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: ''
  )


  User.create!(
    account_name: 'hot_or_ice',
    email: 'chikage@test17.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'どっち？？'
  )


  User.create!(
    account_name: 'hotdog',
    email: 'chikage@test18.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: 'コストコ180'
  )


  User.create!(
    account_name: 'gaimon',
    email: 'chikage@test19.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '宝箱から出れません'
  )


  User.create!(
    account_name: 'NAOYA',
    email: 'chikage@test20.com',
    password: ENV['PUBLIC_GUEST_PASSWORD'],
    introduction: '名前を考えるのは苦手です'
  )


# 投稿データ
LocationReport.create!(
    user_id: 1,
    title: "羽田空港",
    area: "関東",
    address: "東京都大田区羽田空港３丁目３−２",
    date: "2022-07-22",
    body: "夜中の空港の空がだいぶ飛行機渋滞していました",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 2,
    title: "東京駅に行ってきました！！",
    area: "関東",
    address: "東京都千代田区丸の内１丁目",
    date: "2022-07-10",
    body: "確か丸の内から出たところにある本屋さんに久しぶりに行きました",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 5,
    title: "銀だこ",
    area: "関東",
    address: "東京都中央区八重洲１丁目５−１０ 井門八重洲ビル 1Ｆ 八重洲北口店",
    date: "2022-07-10",
    body: "意外と銀だこって高いから一つ一つを大切に食べてしまう",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 9,
    title: "スターバックスリザーブ",
    area: "関東",
    address: "東京都中央区銀座３丁目７−３ 銀座オーミビル 1F",
    date: "2019-11-10",
    body: "目黒には入れなかったけど、東京駅の方のリザーブには入れました。",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "ゴンチャ",
    area: "関東",
    address: "東京都中央区日本橋本町２丁目１−１ 武田グローバル本社ビル 1F",
    date: "2018-12-15",
    body: "ちょっと甘さ控えめのに今度からしよ",
    event: "学校帰り",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "専門時代のバイト先",
    area: "関東",
    address: "東京都中央区銀座８丁目７−７ ジュノー銀座誠和ビル 7F",
    date: "2022-07-22",
    body: "お皿割ってすみませんでした。",
    event: "初めてのお皿割り",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "バービーズ",
    area: "関東",
    address: "東京都中央区日本橋本石町１丁目１−９ B1",
    date: "2022-07-22",
    body: "今度は奢られないでちゃんと料理食べるぞ！",
    event: "お疲れさま会",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 8,
    title: "オフィス街のど真ん中",
    area: "関東",
    address: "東京都千代田区内神田２丁目１３−１３",
    date: "2022-07-22",
    body: "都会のど真ん中にある専門学校",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 16,
    title: "最近は行けてない花火",
    area: "関東",
    address: "東京都大田区西六郷１丁目３０−４",
    date: "2022-07-22",
    body: "だいたいこのあたりでやってる花火大会。また行きたい！！（2022は中止だそうです）",
    event: "花火の祭典",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 15,
    title: "東京スカイツリー",
    area: "関東",
    address: "東京都墨田区押上１丁目１−２",
    date: "2022-07-22",
    body: "スカイツリーは登るのもいいけど、下町も楽しかったりする",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 13,
    title: "東京タワー",
    area: "関東",
    address: "東京都港区芝公園４丁目２−８",
    date: "2022-07-22",
    body: "夜に遠目で見るぐらいがちょうどいい！！後下から見上げるのもEVAっぽくていい",
    event: "シンエヴァ",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 8,
    title: "成田空港",
    area: "関東",
    address: "千葉県成田市古込１−１",
    date: "2022-07-22",
    body: "裏事情で飛行場の中に民家があるらしい",
    event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 14,
    title: "横浜駅",
    area: "関東",
    address: "神奈川県横浜市西区高島２丁目",
    date: "2022-07-22",
    body: "ちっさい頃から何度も通ってた横浜駅。もう完成したのかな？",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 14,
    title: "納車記念で一泊！",
    area: "関東",
    address: "神奈川県横浜市中区山下町280ｰ2",
    date: "2022-07-22",
    body: "みなとみらいからは離れてるかな",
    event: "納車記念",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 19,
    title: "ロドイモさんいなかった",
    area: "関東",
    address: "神奈川県横浜市中区新港１丁目１",
    date: "2022-07-22",
    body: "いつか黒ビールをあそこで飲みたい、、！",
    event: "カンパイヨコハマ",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 16,
    title: "ジャンプショップ横浜！！",
    area: "関東",
    address: "神奈川県横浜市西区みなとみらい２丁目２−１ ランドマークプラザ 2階 横浜・",
    date: "2022-07-22",
    body: "この間行った時は小畑健さんのラフ画があって買えばよかったと後悔したww",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 15,
    title: "鶴岡八幡宮",
    area: "関東",
    address: "神奈川県鎌倉市雪ノ下２丁目１−３１",
    date: "2022-03-22",
    body: "勝ち守の効果はあるのかな？？だいたい結婚式やってるよね",
    event: "初詣",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 6,
    title: "リッツカールトン沖縄",
    area: "沖縄",
    address: "沖縄県名護市喜瀬１３４３−１",
    date: "2022-07-22",
    body: "絶対行く",
    # event: "",
    publication_status: false,
    report_status: false
    )
