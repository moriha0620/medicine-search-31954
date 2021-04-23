# README

[![Image from Gyazo](https://i.gyazo.com/83f0c8f5d7339eb00b02afe23a490bc6.png)](https://gyazo.com/83f0c8f5d7339eb00b02afe23a490bc6)

アプリケーション名：　medicine-search-31954（おくすり検索）

アプリケーション概要：　ユーザーの選択した症状に合わせておすすめの一般用医薬品を表示することができるLINEBot

URL：https://medicine-search-31954.herokuapp.com/callback

ボットのベーシックID:	@542ikdnu

QRコード：

[![Image from Gyazo](https://i.gyazo.com/84937b85f6595adc36d09226ac76d2da.png)](https://gyazo.com/84937b85f6595adc36d09226ac76d2da)



利用方法：　上記のボットのベーシックIDもしくはQRコードからLINEアカウント「おくすり検索」を友だち追加。最初になにか文字を入れるとbotから返信が来るのでそちらに沿って症状を選択していくことで必要な医薬品を検索することができる。

目指した課題解決：　このアプリケーションを通じて、高齢者を中心にドラッグストアへ直接行かなくても自身の症状に合わせた一般用医薬品を表示し、楽天市場から購入することができる。また店頭で迷わず一般用医薬品を購入することができる。これにより自身のちょっとした不調に対してセルフメディケーションを達成することができ医療機関への受診、薬局での薬の処方といった通院にかかる時間を省き、生活の質を向上できる。一方で人口減少、超高齢社会における医師不足からの医療機関受診の機会喪失に対する一助となる。

要件定義：　
症状選択による医薬品検索機能　高齢者でも回答しやすいように、Webhookイベントオブジェクトの中でもボタンテンプレートを採用した。仕様上選択肢を４つまでしか定められないので、回答のハードルを下げる手段として活用した。

[![Image from Gyazo](https://i.gyazo.com/4b4e47cf87a745134559eebb2f98b6f9.gif)](https://gyazo.com/4b4e47cf87a745134559eebb2f98b6f9)

楽天市場へのリンク機能　テンプレートの定めるプロパティに沿ってリンクを設定し、楽天市場でも医薬品のパッケージが明確に設定されているサイトを選択した。

[![Image from Gyazo](https://i.gyazo.com/eeb161ec1ae45581b8d93ff744fd6a3a.gif)](https://gyazo.com/eeb161ec1ae45581b8d93ff744fd6a3a)

医薬品の剤形表示機能　同じ効能効果の医薬品であれば剤形や使用感をユーザーが選択できるよう、検索結果によってはWebhookイベントオブジェクトのカルーセルテンプレートが表示され横スクロールで剤形を表示できる。

[![Image from Gyazo](https://i.gyazo.com/aaad9bfacccf165adc8102fc0e871768.gif)](https://gyazo.com/aaad9bfacccf165adc8102fc0e871768)


実装予定の機能：
ドラッグストア検索機能　google Maps APIを活用することで、ドラッグストアの検索を可能とする。これにより旅行先など土地勘のない場所で体調不良となっても自身の現在位置から近くのドラッグストアを割り出し、希望の医薬品を購入できる。

フローチャート設計：

[![Image from Gyazo](https://i.gyazo.com/248419052d7ee53beea7be9d4bfc142c.png)](https://gyazo.com/248419052d7ee53beea7be9d4bfc142c)


使用技術：
・Ruby 2.6.5
・Ruby on Rails 6.0.3.6
・MySQL 5.6.50
・Homebrew 3.0.9
・rbenv 1.1.2
・Bundler 2.1.4
・yarn 1.22.10
・Messaging API/LINE Developers
・ngrok 2.3.35
・heroku 7.47.11
・RSpec