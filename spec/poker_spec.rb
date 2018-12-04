require './poker'
require 'rspec'

describe "A pocker deck: " do
  before :each do
    @the_deck = Deck.new()
  end

  it "has 52 cards" do
    expect(@the_deck.how_many_cards).to eq 52
  end

  it "with suits: spades, hearts,clubs and diamonds" do
    a_card = @the_deck.draw

    expect(['C','D','H','S']).to include a_card.suit
  end


  it "and values between 2 and 9 or a figure" do
    a_card = @the_deck.draw
    values = ['A','2','3','4','5','6','7','8','9','T','J','Q','K']
    the_value = a_card.value
    
    expect(values.include?(the_value)).to be true
  end
  
  it "deals poker hands of 5 cards" do
    a_hand = @the_deck.deal
    expect(a_hand.how_many_cards).to eq 5
  end

end

describe "a Card" do
  it "can be compared by value" do
    a_card = Card.new('CA')
    another_card = Card.new('C2') 
      
    expect(a_card > another_card).to be true
    expect(Card.new('C7') > Card.new('CK')).to be false
  end
end


describe "a Hand" do
  describe "when ranked" do
    it "can be ranked by high card" do
      expect(Hand.new('C4C5C6C2C3').rank.highcard).to eq 'C6'
    end

    it "can be ranked by pair" do

      expect(Hand.new('C3C4C6H6H7').rank.pair).to eq('6')
    end
  end
end