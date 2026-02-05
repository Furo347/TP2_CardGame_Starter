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
    
    class Game {
        var player1: Player
        var player2: Player
        var deck: Deck

        init(player1: Player, player2: Player) {
            self.player1 = player1
            self.player2 = player2
            self.deck = Deck()
        }

        func dealCards() {
            deck.shuffle()
            while let card = deck.draw() {
                if player1.hand.count <= player2.hand.count {
                    player1.receiveCard(card)
                } else {
                    player2.receiveCard(card)
                }
            }
        }

        func playRound() {
            var card1 = player1.playCard()
            var card2 = player2.playCard()
            print("\(player1.name) plays: \(card1?.description ?? "No card")")
            print("\(player2.name) plays: \(card2?.description ?? "No card")")

            if let c1 = card1, let c2 = card2 {
                if c1 > c2 {
                    player1.score += 1
                    print("\(player1.name) wins the round!\n")
                } else if c2 > c1 {
                    player2.score += 1
                    print("\(player2.name) wins the round!\n")
                } else {
                    print("It's a War!\n") 
                    //Dans le cas d'égalité, chaque joueur doit poser 3 cartes face cachées et une carte face visible. Le joueur avec la carte visible la plus haute remporte la manche. Si les cartes visibles sont à nouveau égales, le processus se répète jusqu'à ce qu'un gagnant soit déterminé.
                }
            }  
        }
       
        func play() {
            dealCards()
            while !player1.hand.isEmpty && !player2.hand.isEmpty {
                playRound()
            }
            print("Final Scores: \(player1.name): \(player1.score), \(player2.name): \(player2.score)")
            if player1.score > player2.score {
                print("\(player1.name) wins the game!")
            } else if player2.score > player1.score {
                print("\(player2.name) wins the game!")
            } else {
                print("The game is a tie!")
            }
        }
    }
    
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
