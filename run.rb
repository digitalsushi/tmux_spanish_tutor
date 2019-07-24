#!/bin/env ruby

require 'csv'
require 'pp'

data={}

csv=CSV.parse(File.read("#{File.dirname(__FILE__)}/jehle_verb_database.csv").chomp, headers: true, liberal_parsing: true)

csv.each do |row|
  this_verb=row[0].gsub(/"/,'')
  if data[this_verb]
    current_verb=data[this_verb]
  else
    data[this_verb]= {} 
    current_verb=data[this_verb]
    current_verb[:verb]=this_verb
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

  current_verb[:infinitive]=infinitive
  current_verb[mood]={} unless current_verb[mood]
  current_verb[mood][tense]={} unless current_verb[mood][tense]
  current_verb[mood][tense][:verb]=verb
  current_verb[mood][tense][:s1]=s1
  current_verb[mood][tense][:s2]=s2
  current_verb[mood][tense][:s3]=s3
  current_verb[mood][tense][:p1]=p1
  current_verb[mood][tense][:p3]=p3
end

r=data[data.keys.sample]

# uncomment this to see every mood and tense stored in the tree.
# pp data

# Right now, I only want the indicative present verb, and I dont want second person plural so there is no p2 variable stored above.
# You could reference other moods and tenses as symbol names since they are just coming right in from the csv database.
puts "#{r[:verb]}:#{r[:infinitive]}:#{r[:indicative][:present][:s1]}/#{r[:indicative][:present][:s2]}/#{r[:indicative][:present][:s3]}/#{r[:indicative][:present][:p1]}/#{r[:indicative][:present][:p3]}"
