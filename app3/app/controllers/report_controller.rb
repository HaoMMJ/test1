class ReportController < ApplicationController
  require 'net/http'

  def report1
    url = URI.parse("#{ENV['APP1_URL']}/report")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    @items = JSON.parse res.body
    render :template => 'report/recent_items'
  end

  def report2
    url = URI.parse("#{ENV['APP2_URL']}/report")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    @items = JSON.parse res.body
    render :template => 'report/recent_items'
  end
end
