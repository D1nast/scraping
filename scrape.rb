require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.lancers.jp/work/detail/4512081'
html = URI.open(url).read
doc = Nokogiri::HTML.parse(html)
title = doc.title

puts title

# 出力するデータ
data = [
  [title],
  [title],
]

# CSVファイルに書き出す
CSV.open("output.csv", "w") do |csv|
  data.each do |row|
    csv << row
  end
end