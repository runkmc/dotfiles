require 'rspec/core/formatters/base_text_formatter'

class Blinker < RSpec::Core::Formatters::BaseTextFormatter

  RSpec::Core::Formatters.register self, :start, :example_passed, 
    :example_pending, :example_failed

  COLORS = {off: "--rgb=0,0,0", fail: "--rgb=255,10,10", pending: "--rgb=255,200,0",
            pass: "--rgb=10,255,10"}

  def start(notifier)
    set_blink(:off)
    @current_color = :off
    @failed = false
  end

  def set_blink(color)
    @current_color = color
    command = %W[bt #{COLORS[color]} -d 0]
    system *command
  end

  def example_passed(notifier)
    set_blink(:pass) if starting?
  end

  def example_pending(notifier)
    set_blink(:pending) if starting? || passing?
  end

  def example_failed(notifier)
    set_blink(:fail) unless failing?
    @failed = true
  end

  # def stop
  #   system "afplay /Users/kevin/horn.mp3 &" if @failed
  # end

  def passing?
    @current_color == :pass
  end

  def starting?
    @current_color == :off
  end
  
  def pending?
    @current_color == :pending
  end

  def failing?
    @current_color == :fail
  end
end
