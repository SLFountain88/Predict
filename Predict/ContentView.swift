//
//  ContentView.swift
//  Predict
//
//  Created by DPI Student A023 on 6/25/25.
//

import SwiftUI

struct ContentView: View {
    private let choicesArray = ["It is certain",
                                       "It is decidedly so",
                                       "Without a doubt",
                                       "Yes, definitely",
                                       "You may rely on it",
                                       "As I see it, yes",
                                       "Most likely",
                                       "Outlook good",
                                       "Yes",
                                       "Signs point to yes",
                                       "Reply hazy try again",
                                       "Ask again later",
                                       "Better not tell you now",
                                       "Cannot predict now",
                                       "Concentrate and ask again",
                                       "Don't count on it",
                                       "My reply is no",
                                       "My sources say no",
                                       "Outlook not so good",
                                       "Very doubtful"]
    //below is for the no repeat while code
    @State private var prediction = ""
    //@State private var newPrediction = ""
    //if I want this variable to live for the whole code, then I bring it back here
    //
    var body: some View {
        VStack {
            Spacer()
            //
            //Image(.predictBall)
            ZStack {
                Image("predict-ball-image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                Circle()
                    .foregroundStyle(.indigo)
                    .frame(width: 140, height: 140)
                    .offset(y: -20)
                Text(prediction)
                    .font(.largeTitle)
                //.fontWeight(.black)
                    //.frame(height: 120)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.4)
                    .background(.clear)
                    .frame(width: 90, height: 100)
                    .offset(y: -20)
                    .foregroundStyle(.white)
                    .animation(.default, value: prediction)
                    
            }
            //
            Spacer()
            //            Button {
            //                //action
            //                //
            //            } label: {
            //                //label
            //                Text("Hit Me!")
            //            }
            Button("Hit Me!") {
                //action
                //below is if you want an option to repeat
                //prediction = choicesArray.randomElement() ?? "No Prediction"
               
                //below is if you do not want an option to repeat
                
                //when you delete the variable from above, you can put a var here
                //newPrediction only lives within these {} aka closure
                var newPrediction = choicesArray.randomElement() ?? "No choices available"
                while newPrediction == prediction {
                    print("I would have repeated \(prediction)")
                    newPrediction = choicesArray.randomElement() ?? "No choices available"
                }

                prediction = newPrediction
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.indigo)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
