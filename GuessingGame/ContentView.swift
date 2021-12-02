//
//  ContentView.swift
//  GuessingGame
//
//  Created by Madison Dellamea on 12/2/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored Properties
    // The current guess of the user.
    
    @State var currentGuess: Double = 50.0
    
    //MARK: Computed Properties
    // The target that we are trying to guess.
    // THis will produce an integer in the range 1 to 100, inclusive
    
    let target = Int.random(in: 1...100)
    
    @State var feedback = "" // No hint to start the game.
    
    var body: some View {
        
        VStack {
            
            Slider(value: $currentGuess,
                   in: 0.0...100.0,
                   step: 1.0,
                   label: {
                        Text("Guess")
            },
                   minimumValueLabel: {
                        Text("0")
            },
                   maximumValueLabel: {
                        Text("100")
            })
            
            
            //output
            Text("\(String(format: "%.2f", currentGuess))")
                .font(.largeTitle)
                .bold()
            
            Button(action: {
              
                // Make the user's guess into an integer.
                
            //  BAD EXAMPLE: let cgaai = Int(currentGuess)
                
                // Why? - Hard to remember (confusing)
                
                let currentGuessAsAnInteger = Int(currentGuess)
                
                // Compare the user's current guess to the target.
                
                if currentGuessAsAnInteger < target {
                    
                    feedback = "Guess higher next time!"
                    
                } else if currentGuessAsAnInteger > target {
                    
                    feedback = "Guess lower next time!"
                    
                } else { // if currentGuessAsAnInteger == target {
                    
                    feedback = "You Got It!"
                // }
                }
                
            }, label: {
                Text("Submit Guess")
            })
            .buttonStyle(.bordered)
            
            Text("The super secret target is \(target)")
                .padding()
            
            Text(feedback)
                .italic()
                .padding()
            
            Spacer()
        }
        .navigationTitle("Guessing Game")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            ContentView()
        }
        
    }
    
}
