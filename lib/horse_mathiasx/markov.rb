require 'marky_markov'

module HorseMathiasx
  class Markov
    def self.prepare!
      self.new
    end

    def initialize
      @markov = MarkyMarkov::Dictionary.new('dictionary')
      @markov.parse_file(ENV['PATH_TO_TWEETS_CLEAN'])
    end

    def generate(*p)
      @markov.generate_n_sentences(2).split(/\#\</).first.chomp.chop
    end
  end
end
