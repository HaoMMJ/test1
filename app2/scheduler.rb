require File.expand_path('../config/boot',        __FILE__)  
require File.expand_path('../config/environment', __FILE__)  
require 'clockwork'

module Clockwork  
  configure do |config|
    config[:logger] = Logger.new('log/clockwork.log')
  end

  every(1.minutes, 'Seeder') do
    SeederJob.perform_now
  end

  every(2.minutes, 'Consumer') do
    ConsumerJob.perform_now
  end
end