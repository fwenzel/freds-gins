#!/usr/bin/env ruby

require 'date'


if ARGV.length < 1
  puts "Usage: #{$0} \"Delicious Gin\""
  exit 1
end

name = ARGV.first
shortname = name.downcase.gsub(/\W+/, '-')
postdate = Date::today.to_s
filename = "_posts/#{postdate}-#{shortname}.md"

if File.exist?(filename)
  puts "Output file #{filename} already exists :o"
  exit 1
end

TEMPLATE = <<~EOT
---
layout: post
title:  "#{name}"
date:   #{postdate} 12:00:00Z
categories: gin
---
This gin...

![#{name}, front](/pics/#{shortname}-1.jpg)

![#{name}, back](/pics/#{shortname}-2.jpg)

...

## Verdict
![5 stars](/assets/star5.png)

A summary...
EOT

File.new(filename, 'w').write TEMPLATE
