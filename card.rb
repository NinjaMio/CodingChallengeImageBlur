
raise RuntimeError, "Please provide a 2D array with the same length and width as an argument." if matrix.length != matrix[0].length

class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  # def self.random_card
  #   Card.new(rand(10), :spades)
  # end
end

class Deck
  def initialize
    @cards = []

    ranks = (2..10).to_a + [:J, :Q, :K, :A]
    suits = [:spades, :hearts, :clubs, :diamonds]

    ranks.each do |rank|
      suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  # return Card or nil
  def deal
    @cards.shift
  end

  def deal_deck
    while !@cards.empty? do
      @cards.shift.output_card
    end
  end
end

deck = Deck.new
deck.shuffle
deck.deal_deck

card = deck.deal
card.output_card