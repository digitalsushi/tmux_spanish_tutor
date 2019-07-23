#!/bin/env ruby

require 'csv'
require 'pp'
require'json'

verbs=[]
data={}

csv=CSV.parse(File.read("#{File.dirname(__FILE__)}/jehle_verb_database.csv").chomp, headers: true, liberal_parsing: true)

csv.each do |row|
  verbs.push row[0].gsub(/"/,'')
end
verbs=verbs.uniq

csv.each do |row|
  this_verb=row[0].gsub(/"/,'')
  if data[this_verb]
    stuff=data[this_verb]
  else
    data[this_verb]= {} 
    stuff=data[this_verb]
    data[this_verb][:verb]=this_verb
  end

  infinitive=row[1].gsub(/"/,'').strip.downcase
  mood=row[3].gsub(/"/,'').strip.downcase.gsub(/ /,'_').gsub(/[()]/, "").to_sym
  tense=row[5].gsub(/"/,'').strip.downcase.gsub(/ /,'_').gsub(/[()]/, "").to_sym
  verb=row[6].gsub(/"/,'').strip
  s1=row[7].gsub(/"/,'').strip
  s2=row[8].gsub(/"/,'').strip
  s3=row[9].gsub(/"/,'').strip
  p1=row[10].gsub(/"/,'').strip
  p3=row[12].gsub(/"/,'').strip

  stuff[:infinitive]=infinitive
  stuff[mood]={} unless stuff[mood]
  stuff[mood][tense]={} unless stuff[mood][tense]
  stuff[mood][tense][:verb]=verb
  stuff[mood][tense][:s1]=s1
  stuff[mood][tense][:s2]=s2
  stuff[mood][tense][:s3]=s3
  stuff[mood][tense][:p1]=p1
  stuff[mood][tense][:p3]=p3
end

r=data[data.keys.sample]

puts "#{r[:verb]}:#{r[:infinitive]}:#{r[:indicative][:present][:s1]}/#{r[:indicative][:present][:s2]}/#{r[:indicative][:present][:s3]}/#{r[:indicative][:present][:p1]}/#{r[:indicative][:present][:p3]}"
