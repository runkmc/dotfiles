#!/usr/bin/env ruby
require 'rubygems'
require 'wunderground'

class TimedWeather
  
attr_accessor :saved_weather

  def initialize
    @delay = 600
    @home = ENV['HOME']
    @filename = "#{@home}/.rubyweather.txt"
    @time_last_updated = nil
  end

  def get_weather
    self.get_tmp_contents
      if @last_time_updated > (Time.now - @delay)
          return
    else
     w = Wunderground.new
     c = w.conditions_for("94598") 
     @saved_weather = " #{c['current_observation']['weather']} - #{c['current_observation']['temp_f'].to_i} "
     self.write_file
     return @saved_weather     
  end
  end

  def write_file
    self.create_file
    file = File.open @filename, "w"
    file.puts (Time.now).to_i
    file.puts @saved_weather
    file.close
  end

  def create_file
    file = File.new @filename, "w"
    file.close
  end

  def get_tmp_contents
    if File.exist? @filename
      File.open @filename, "r+" do |file|
        tmp_time = file.gets
        @last_time_updated = Time.at tmp_time.to_i
        @saved_weather = file.gets
      end
    end
  end

end

wea = TimedWeather.new
wea.get_weather
puts wea.saved_weather
