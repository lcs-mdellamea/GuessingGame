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
                // NOTE: Output will not be shown unless this app is run in the "full" simulator
                print("Button was pressed")
            }, label: {
                Text("Submit Guess")
            })
            .buttonStyle(.bordered)
            
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
