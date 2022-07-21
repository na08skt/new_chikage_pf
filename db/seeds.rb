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
    introduction: 'このアカウントはゲストログイン専用の
    アカウントのため機能が制限されています。機能をご利用
    したい場合は、お手数ですがご自身でアカウントを作成し
    てください。'
  )

User.create!(
    account_name: 'chikage_test1',
    email: 'chikage@test1.com',
    password: 'chikage',
    introduction: '現在使用中のユーザは”chikage_test１”です'
  )

User.create!(
    account_name: 'chikage_test2',
    email: 'chikage@test2.com',
    password: 'chikage',
    introduction: '現在使用中のユーザは”chikage_test2”です'
  )

User.create!(
    account_name: 'chikage_test3',
    email: 'chikage@test3.com',
    password: 'chikage',
    introduction: '現在使用中のユーザは”chikage_test3”です'
  )
  
  
# 投稿データ
LocationReport.create!(
    user_id: 1,
    title: "羽田空港",
    area: "関東",
    address: "東京都大田区羽田空港３丁目３−２",
    date: 2022-07-22,
    body: "初めて行きました",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 2,
    title: "東京駅に行ってきました！！",
    area: "関東",
    address: "東京都千代田区丸の内１丁目",
    date: 2022-07-10,
    body: "修学旅行の集合が東京駅でした",
    event: "京都修学旅行",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 2,
    title: "銀だこ",
    area: "関東",
    address: "東京都中央区八重洲１丁目５−１０ 井門八重洲ビル 1Ｆ 八重洲北口店",
    date: 2022-07-10,
    body: "集合前に銀だこに行ってきました！！",
    event: "京都修学旅行",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "スターバックスリザーブ",
    area: "関東",
    address: "東京都中央区銀座３丁目７−３ 銀座オーミビル 1F",
    date: 2019-11-10,
    body: "目黒には入れなかったけど、東京駅は入れました。今度は友達といってみたい",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "ゴンチャ",
    area: "関東",
    address: "東京都中央区日本橋本町２丁目１−１ 武田グローバル本社ビル 1F",
    date: 2018-12-15,
    body: "また誘われてしまった。ちょっと甘さ控えめのに今度からしよ",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "専門時代のバイト先",
    area: "関東",
    address: "東京都中央区銀座８丁目７−７ ジュノー銀座誠和ビル 7F",
    date: 2022-07-22,
    body: "本当にいろいろあったバイト先！お皿割ってすみませんでした。",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "バービーズ",
    area: "関東",
    address: "東京都中央区日本橋本石町１丁目１−９ B1",
    date: 2022-07-22,
    body: "本当によくしてもらってるお店！今度は奢られないでちゃんと料理食べるぞ！",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 2,
    title: "もっと勉強すればよかった",
    area: "関東",
    address: "東京都千代田区内神田２丁目１３−１３",
    date: 2022-07-22,
    body: "もっと勉強すればよかった。本当に後悔。",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 2,
    title: "最近は行けてない花火",
    area: "関東",
    address: "東京都大田区西六郷１丁目３０−４",
    date: 2022-07-22,
    body: "だいたいこのあたりでやってる花火大会。また行きたい！！（2022は中止だそうです）",
    event: "大田区平和都市宣言記念事業「花火の祭典」",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "東京スカイツリー",
    area: "関東",
    address: "東京都墨田区押上１丁目１−２",
    date: 2022-07-22,
    body: "スカイツリーは登るのもいいけど、下町も楽しかったりする",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "東京タワー",
    area: "関東",
    address: "東京都港区芝公園４丁目２−８",
    date: 2022-07-22,
    body: "夜に遠目で見るぐらいがちょうどいい！！後下から見上げるのもEVAっぽくていい",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "成田空港",
    area: "関東",
    address: "千葉県成田市古込１−１",
    date: 2022-07-22,
    body: "以前の就活で飛行機が飛ばなかった時は本当に心臓がバクバクでした。",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 1,
    title: "横浜駅",
    area: "関東",
    address: "神奈川県横浜市西区高島２丁目",
    date: 2022-07-22,
    body: "ちっさい頃から何度も通ってた横浜駅。もう完成したのかな？",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 2,
    title: "納車記念で一泊！今年は売って一泊？",
    area: "関東",
    address: "神奈川県横浜市中区山下町280ｰ2",
    date: 2022-07-22,
    body: "いいホテルでした！！もっと楽しめたけど全ていい雰囲気のホテルでした。ちょっとみなとみらいからは離れてるかな",
    event: "納車記念",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 1,
    title: "絶対に何かしらのイベントやってるところ",
    area: "関東",
    address: "神奈川県横浜市中区新港１丁目１",
    date: 2022-07-22,
    body: "いつか黒ビールをあそこで飲みたい、、！",
    event: "カンパイヨコハマ",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 2,
    title: "ジャンプショップ横浜！！",
    area: "関東",
    address: "神奈川県横浜市西区みなとみらい２丁目２−１ ランドマークプラザ 2階 横浜・",
    date: 2022-07-22,
    body: "全然いけてないな！！この間行った時は大葉つぐみさんのラフ画があって買えばよかったと後悔したww",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 3,
    title: "鶴岡八幡宮",
    area: "関東",
    address: "神奈川県鎌倉市雪ノ下２丁目１−３１",
    date: 2022-07-22,
    body: "勝ち守の効果はあるのかな？？だいたい結婚式やってるよね",
    # event: "",
    publication_status: false,
    report_status: false
    )

LocationReport.create!(
    user_id: 1,
    title: "リッツカールトン沖縄",
    area: "沖縄",
    address: "沖縄県名護市喜瀬１３４３−１",
    date: 2022-07-22,
    body: "いつか行ってみたいリッツカールトン",
    # event: "",
    publication_status: false,
    report_status: false
    )
