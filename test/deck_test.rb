require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal [@card1, @card2, @card3], @deck.cards
  end

  def test_it_can_find_card_ranks
    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 3, @deck.rank_of_card_at(1)
    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_it_can_find_high_ranking_cards
    expected = [@card1, @card3]
    assert_equal expected, @deck.high_ranking_cards
  end

  def test_it_can_return_percent_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_remove_first_card
    @deck.remove_card
    assert_equal [@card2, @card3], @deck.cards
  end
end
