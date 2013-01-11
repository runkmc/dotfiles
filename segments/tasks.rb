#!/usr/bin/env ruby

due_command = `/Users/kevin/.dotfiles/segments/ofduetasks.sh`

due_soon = due_command.slice /^DUE \(\d+/
due_soon.slice! "DUE ("
overdue = due_command.slice /OVERDUE \(\d+/
overdue.slice! "OVERDUE ("

puts "#{due_soon} due | #{overdue} overdue"
