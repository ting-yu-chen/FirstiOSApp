//
//  ContentView.swift
//  FirstiOSApp
//
//  Created by TingyuChen on 2021/2/16.
//

import SwiftUI

struct ContentView: View {
    @State private var from_str: String = ""
    @State private var to_str: String = ""
    @State private var from_int:Int? = 0
    @State private var to_int:Int? = 0
    @State private var generated_int: Int = 0
    @State private var shownText = "?"
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                Text("Generate a random integer: ").font(Font.system(size: 25)).foregroundColor(Color.black)
                Spacer()
                HStack{
                    Text("From:").foregroundColor(Color.black)
                    TextField("from", text: $from_str)
                        .padding(.horizontal, 40)
                        .background(Color.white)
                        .foregroundColor(.black)
                }.padding()
                HStack{
                    Text("To:    ").foregroundColor(Color.black)
                    TextField("to", text: $to_str)
                        .padding(.horizontal, 40)
                        .background(Color.white)
                        .foregroundColor(.black)
                }.padding()
                
                Spacer()
                Button("Generate",
                action:{
                    if let from_int =  Int(from_str) , let to_int = Int(to_str){
                        if from_int < to_int{
                            generated_int = Int.random(in: from_int...to_int)
                            shownText = String(generated_int)
                        }
                        else{
                            generated_int = Int.random(in: to_int...from_int)
                            shownText = String(generated_int)
                        }
                    }
                    else{
                        shownText = "Invalid Input"
                    }
                    
                }).foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                Spacer()
                Spacer()
                Text(shownText).font(Font.system(size: 50)).foregroundColor(Color.black)
                Spacer()
            }.padding(.all, 10)
        }
    }
}

// we can decide what to preview here
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
// when publish the app, it becomes production mode
