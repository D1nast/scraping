#必要なもの　seleniumのgem open-urlのgem csvのgem rubyの実行環境

# encoding: utf-8

require 'open-uri'
require 'csv'
require "selenium-webdriver"


def getData(n)
    data = []

    driver = Selenium::WebDriver.for :chrome
    driver.get "https://minkabu.jp/yutai/popular_ranking"

    i = 2
    n.times do
        link =  driver.find_element(:xpath,"//*[@id=\"month_tab_box\"]/li[#{i}]/a")
        link.click
        sleep(5)
        getTitle = driver.find_element(:xpath,'//*[@id="v-yutai-app"]/div[2]/div[2]/div/div[1]/div/ol/li[1]/div/div/div[1]/div/div[1]/a')
        i = i + 1
        data << getTitle.text
    end

    driver.quit

    CSV.open("output.csv", "w",encoding: "Shift_JIS") do |csv|
        data.each do |row|
            csv << [row]
        end
    end
end

getData(12)