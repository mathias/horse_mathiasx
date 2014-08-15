require 'faraday'
require 'json'

module HorseMathiasx
  class Replier
    def initialize(markov)
      @markov = markov
    end

    def got_message(json)
      puts "got #{json}"

      message_to_say = @markov.generate

      puts "said #{message_to_say} to slack"

      uri = "https://bendyworks.slack.com/services/hooks/incoming-webhook?token=#{ENV['SLACK_INCOMING_WEBHOOK_TOKEN']}"

      payload = {
         "username" => "horse_mathiasx",
         "icon_url" => ENV['AVATAR_IMG_URL'],
         "text" => message_to_say
      }

      Faraday.post do |req|
        req.url uri
        req.headers['Content-Type'] = 'application/json'
        req.body = JSON.generate(payload)
      end
    end
  end
end
