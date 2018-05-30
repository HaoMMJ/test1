class ReportController < ApplicationController
  require 'net/http'

  def report1
    url = URI.parse("#{ENV['APP1_URL']}/report")
    req = Net::HTTP::Get.new(url.request_uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    @items = JSON.parse http.request(req).body
    render :template => 'report/recent_items'
  end

  def report2
    url = URI.parse("#{ENV['APP2_URL']}/report")
    req = Net::HTTP::Get.new(url.request_uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    @items = JSON.parse http.request(req).body
    render :template => 'report/recent_items'
  end
end
