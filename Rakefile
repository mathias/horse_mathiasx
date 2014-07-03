require 'rake'
require 'csv'
require 'dotenv'

unless ['staging', 'production'].include? ENV['RACK_ENV']
  Dotenv.load
end

#unless ['staging', 'production'].include? ENV['RACK_ENV']
  #require 'rspec/core/rake_task'
  #RSpec::Core::RakeTask.new(:spec)
  #task default: ['cane:all', :spec]
#end

# This task inspired by https://gist.github.com/busterbenson/6695350
desc "Generate a tweet markov dictionary"
task :generate_markov_dictionary do
  # Go to Twitter.com -> Settings -> Download Archive.
  # This tweets.csv file is in the top directory. Put it in this repo.
  csv_text = CSV.parse(File.read(ENV['PATH_TO_TWEETS_CSV']))

  # Create a new clean file of text that acts as the seed for your Markov chains
  File.open(ENV['PATH_TO_TWEETS_CLEAN'], 'w') do |file|
    csv_text.reverse.each do |row|
      # Strip links and new lines
      tweet_text = row[5].gsub(/(?:f|ht)tps?:\/[^\s]+/, '').gsub(/\n/,' ')
      # Save the text
      file.write("#{tweet_text}\n")
    end
  end
  puts "Done! Commit and push #{ENV['PATH_TO_TWEETS_CLEAN']}."
end
