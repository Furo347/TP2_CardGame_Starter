// TP2 - Card Game System
// Card Game Manager with Singleton Pattern

import Foundation

// Game Manager avec singleton pattern
final class CardGameManager {
    static let shared = CardGameManager()

    private init() {}

    // TODO: 3-7. Implémenter les autres composants
    class Deck {
        var cards: [Card] = []

        init() {
            for suit in Suit.allCases {
                for rank in Rank.allCases {
                    cards.append(Card(rank: rank, suit: suit))
                }
            }
        }

        func shuffle() {
            cards.shuffle()
        }

        func draw() -> Card? {
            return cards.popLast()
        }

        func reset() {
            cards.removeAll()
            for suit in Suit.allCases {
                for rank in Rank.allCases {
                    cards.append(Card(rank: rank, suit: suit))
                }
            }
        }
    }
    
    protocol Player : AnyObject {
        var name: String { get }
        var hand: [Card] { get set }
        var score: Int { get set }
        
        func playCard() -> Card?
        func receiveCard(_ card: Card)
    }

    class HumanPlayer: Player {
        var name: String
        var hand: [Card] = []
        var score: Int = 0

        init(name: String) {
            self.name = name
        }

        func playCard() -> Card? {
            return hand.isEmpty ? nil : hand.removeFirst()
        }

        func receiveCard(_ card: Card) {
            hand.append(card)
        }
    }

    class AIPlayer: Player {
        var name: String
        var hand: [Card] = []
        var score: Int = 0

        init(name: String) {
            self.name = name
        }

        func playCard() -> Card? {
            return hand.isEmpty ? nil : hand.removeFirst()
        }

        func receiveCard(_ card: Card) {
            hand.append(card)
        }
    }
    // - Class Game (7 pts)
    // - Extensions Array<Card> (2 pts)

    func run() {
        print("Card Game: War")
        print("=================\n")

        // TODO: Créer deux joueurs
        // let player1 = HumanPlayer(name: "Alice")
        // let player2 = AIPlayer(name: "Bob")

        // TODO: Créer et lancer une partie
        // let game = Game(player1: player1, player2: player2)
        // game.play()
    }
}
