require 'sinatra/base'
require 'horse_mathiasx/markov'
require 'horse_mathiasx/replier'

markov = HorseMathiasx::Markov.prepare!
replier = HorseMathiasx::Replier.new(markov)

module HorseMathiasx
  module Apps
    class Base < Sinatra::Base
      set :raise_errors, true
      set :show_exceptions, false

      post '/message' do
        puts "got message #{params.to_json}"
        replier.got_message(params.to_json)
        200
      end
    end
  end
end
