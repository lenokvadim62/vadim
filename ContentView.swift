//
//  ContentView.swift
//  Array5
//
//  Created by Oleg Savelyev on 26.03.2022.
//

import SwiftUI
struct Cards{
    var number = 1
    var suit = 0
}

struct ContentView: View {
    
    @State var message = ""
    @State var logging = [String]()
    @State var deck = [Cards]()
    @State var suits = ["Clubs","Spades","Diamonds","Hearts"]
    
    var body: some View {
        VStack{
            Text(message)
            Button("Get card"){
                getCards()
            }
        }
    }
    
    func getCards(){
        let ranCard = Int.random(in: 1...13)
        let ranSuit = Int.random(in: 0...3)
        
        var newCard = Cards()
        newCard.number = ranCard
        newCard.suit = ranSuit
        
        let newLogMessage = String(newCard.number) + "/" + String(newCard.suit)
        
        if logging.contains(newLogMessage){
            message = "Duplicate value"
        } else {
            deck.append(newCard)
            print(deck)
            logging.append(newLogMessage)
            print(logging)
            
            let newCards = newCardGenerator(newCard.number)
            let newSuits = suits[newCard.suit]
            print(newCards)
            print(newSuits)
            
            message = "Generated \(newCards) of \(newSuits)"
        }
    }
    
    func newCardGenerator(_ newCardGen:Int)->String{
        if newCardGen == 1{
            return "Ace"
        } else if newCardGen == 11 {
            return "Jack"
        } else if newCardGen == 12 {
            return "Queen"
        }else if newCardGen == 13 {
            return "King"
        } else {
            return String(newCardGen)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
