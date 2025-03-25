//
//  ContentView.swift
//  Countey
//
//  Created by Olivia Kirby on 3/25/25.
//

import SwiftUI

struct People {
    var number: Int
    var color: Color
}

struct MainView: View {
    @State private var people = People(number: 0, color: Color.red)
    @State private var min = 0
    let colorlist = [Color.pink, Color.purple, Color.cyan, Color.green, Color.indigo, Color.mint, Color.orange, Color.red, Color.yellow, Color.yellow]
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    HStack {
                        Text("\(people.number) people")
                            .font(.system(size:45))
                        Spacer().frame(width:150)
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                .font(.system(size:38))
                                .foregroundColor(.white)
                        }
                    }
                    .offset(y:-30)
                    Spacer().frame(height:610)
                    HStack {
                        Button {
                            people.color = colorlist.randomElement()!
                            if people.number > min {
                                people.number -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                                .font(.system(size:60))
                        }
                        Spacer().frame(width: 220)
                        Button {
                            people.color = colorlist.randomElement()!
                            people.number += 1
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size:60))
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(people.color)
            }
            
            
        }
        
        
        
    }
    
}

struct SettingsView: View {
    @State private var max: Int = 5
    var body: some View {
        Form {
            Section(header: Text("Settings")
                .font(.largeTitle)
                .bold()
                .textCase(nil)
                .foregroundColor(.white)
            ){
                Stepper("Maximum Occupancy: \(max)", value: $max)
            }
        }
    }
}


#Preview {
    MainView().preferredColorScheme(.dark)
}
