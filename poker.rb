class Deck

    def how_many_cards
        52
    end

    def draw
        Card.new('CT')
    end
    def deal
        Hand.new('C2C3C4C5C6')
    end
end

class Hand
    def initialize description
        
    end
    
    def how_many_cards
        5
    end
    
    def rank
        Rank.new
    end
end

class Rank
    def highcard
    end
end

class Card
    VALUES=['2','3','4','5','6','7','8','9','T','J','Q','K','A']

    def initialize description
        @suit = description[0]
        @value = description[1]
    end

    def suit
        @suit
    end

    def value
        @value
    end

    def > another_card
        VALUES.find_index(@value) > VALUES.find_index(another_card.value)
    end
end