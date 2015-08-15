#!/usr/bin/env ruby

require 'rubygems'
require 'mechanize'
require 'colorize'

puts 'One moment please, downloading information from calagator'.colorize :blue

BASE_URL = 'http://calagator.org/'

@agent = Mechanize.new do |agent|
  agent.user_agent_alias    = 'Mac Safari'
  agent.follow_meta_refresh = true
end

start_time = Time.now
page     = @agent.get(BASE_URL)
today    = "Today: #{page.search('#today i').text}"
tomorrow = "Tomorrow: #{page.search('#tomorrow i').text}"
future_items = page.search("#next_two_weeks ul li").each do |list|
  puts "#{list.text}".colorize :background => :black, :color => :white
end

end_time = Time.now

calander = "#{today}\n#{tomorrow}\n#{future_items}"
search_time = end_time - start_time

puts calander
puts "Your search took #{search_time} seconds".colorize :green
