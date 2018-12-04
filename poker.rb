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
        chunks = chop(description)
        @hand = build_from(chunks)
    end
    
    def how_many_cards
        @hand.size
    end
    
    def rank
        Rank.new(@hand)
    end

    private

    def chop(description)
        description.scan(/.{2}/)
    end

    def build_from(chunks)
        chunks.map do |chunk|
            Card.new(chunk)
        end
    end
end

class Rank
    PAIR = 2

    def initialize(cards)
        @cards = cards
    end

    def highcard
        card = @cards.max

        card.to_s
    end

    def pair
        paired = @cards.select do |card|
            @cards.count(card) == PAIR
        end

        paired.first.value
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

    def to_s
        @suit + @value
    end

    def > another_card
        VALUES.find_index(@value) > VALUES.find_index(another_card.value)
    end

    def == another_card
        VALUES.find_index(@value) == VALUES.find_index(another_card.value)
    end

    def <=> another_card
        score = VALUES.find_index(@value)
        another_score = VALUES.find_index(another_card.value)

        return 0 if score == another_score
        return -1 if score < another_score
        return 1 if score > another_score
    end
end