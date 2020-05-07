require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn.rb'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn , @turn
  end

  def test_it_has_attributes
    assert_equal @player1 , @turn.player1
    assert_equal @player2 , @turn.player2
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_has_types
    assert @turn.type
  end

  def test_it_has_three_types
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    deck3 = Deck.new([card1, card2, card5, card8])
    deck4 = Deck.new([card4, card3, card6, card7])
    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)
    player1 = Player.new("Megan", deck3)
    player2 = Player.new("Aurora", deck4)
    turn2 = Turn.new(@player1, @player2)
    turn3 = Turn.new(player1, player2)
    assert_equal :basic, @turn.type
    assert_equal :war, turn2.type
    assert_equal :mutually_assured_destruction, turn3.type
  end

  def test_it_can_find_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    deck3 = Deck.new([card1, card2, card5, card8])
    deck4 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    player3 = Player.new("Megan", deck3)
    player4 = Player.new("Aurora", deck4)
    turn2 = Turn.new(player1, player2)
    turn3 = Turn.new(player3, player4)
    assert_equal @player1, @turn.winner
    assert_equal player2, turn2.winner
    #assert_equal @player1, @turn.winner
  end
end
