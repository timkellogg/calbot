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
today    = page.search('#today').text
tomorrow = page.search('#tomorrow').text
future   = page.search('#next_two_weeks').text
end_time = Time.now

calander = "#{today} #{tomorrow} #{future}".gsub(/\u00a0/, '')
search_time = end_time - start_time

puts calander
puts "Your search took #{search_time} seconds".colorize :green
