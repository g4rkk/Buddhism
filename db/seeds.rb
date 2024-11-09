# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
BuddhistQuote.create(content: "長く歩き過ぎて、なぜ旅を始めたのかを忘れてはいけません。")
BuddhistQuote.create(content: "禅はただ座ること。")
BuddhistQuote.create(content: "言葉よりも行動が信仰を証明する。")
BuddhistQuote.create(content: "真理を探求することは、探している時だけ意味がある。")
BuddhistQuote.create(content: "平静を保つことが、最も強力な力である。")
BuddhistQuote.create(content: "慈悲は、すべての行動の中で最も強いものです。")
BuddhistQuote.create(content: "心の中に平安を求めることが、人生の目的です。")
BuddhistQuote.create(content: "一歩ずつ歩み続けることが、進歩への唯一の道です。")
BuddhistQuote.create(content: "自己を知ることが、知識の始まりです。")
BuddhistQuote.create(content: "過去に縛られず、今この瞬間に生きることが、自由をもたらします。")

# 添加新的寺庙数据（日文）
temples = [
  { name: "浅草寺", address: "東京都台東区浅草2丁目3−1", latitude: 35.714765, longitude: 139.796655 },
  { name: "増上寺", address: "東京都港区芝公園4-7-35", latitude: 35.6585805, longitude: 139.7454329 },
  { name: "建長寺", address: "神奈川県鎌倉市山ノ内8", latitude: 35.336283, longitude: 139.550852 },
  { name: "長谷寺", address: "神奈川県鎌倉市長谷3丁目11-2", latitude: 35.316494, longitude: 139.536728 },
  { name: "東大寺", address: "奈良県奈良市雑司町406-1", latitude: 34.687315, longitude: 135.839787 },
  { name: "金閣寺", address: "京都府京都市北区金閣寺町1", latitude: 35.03937, longitude: 135.729243 },
  { name: "清水寺", address: "京都府京都市東山区清水1丁目294", latitude: 34.994856, longitude: 135.785046 },
  { name: "永平寺", address: "福井県吉田郡永平寺町志比5-15", latitude: 36.139951, longitude: 136.497647 },
  { name: "三十三間堂", address: "京都府京都市東山区三十三間堂廻町657", latitude: 34.987512, longitude: 135.773781 },
  { name: "法隆寺", address: "奈良県生駒郡斑鳩町法隆寺山内1-1", latitude: 34.614129, longitude: 135.734361 }
]

# 批量插入寺庙数据
temples.each do |temple|
  BuddhistSite.create(temple)
end

puts "成功导入#{temples.size}個の仏教寺院データ！"