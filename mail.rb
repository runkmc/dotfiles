#!/usr/bin/env ruby

h = ENV['HOME']

gmail = Dir.new "#{h}/.mail/gmail/INBOX/new"
csueb = Dir.new "#{h}/.mail/csueb/INBOX/new"
mcg = Dir.new "#{h}/.mail/mcg/INBOX/new"
icloud = Dir.new "#{h}/.mail/icloud/INBOX/new"

new_mail = (gmail.entries.length + csueb.entries.length + mcg.entries.length + icloud.entries.length) - 8
puts " #{new_mail} " if new_mail > 0
