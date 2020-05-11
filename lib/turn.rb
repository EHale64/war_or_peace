class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    players = [@player1, @player2]
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    players = [@player1, @player2]
    if type == :basic
      players.each do |player|
        @spoils_of_war << player.deck.remove_card
      end
    elsif type == :war
      players.each do |player|
        @spoils_of_war.concat(player.deck.cards[0..2])
      end
    end
  end

  def award_spoils
    if type == :basic || type == :war
      @spoils_of_war.each do |spoils|
        winner.deck.cards << spoils
      end
    end
  end
end
