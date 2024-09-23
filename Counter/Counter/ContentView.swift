//
//  ContentView.swift
//  Counter
//
//  Created by Rachel Dhinakar on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var maxCount = 10
    
    let buttonFontSize: CGFloat = 90
    let titleFontSize: CGFloat = 50
    let textColor: Color = .white
    
    var percentFull: Double{
        return Double(count) / Double(maxCount)
    }
    var body: some View {
        NavigationStack{
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Color.red
                    .opacity(percentFull)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("\(count) People")
                            .font(.system(size: titleFontSize))
                            .foregroundStyle(textColor)
                        Spacer()
                        NavigationLink {
                            SettingsView(maxCount: $maxCount)
                        } label: {
                            Image(systemName: "gear")
                                .font(.system(size: titleFontSize))
                                .foregroundStyle(textColor)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    .padding()
                    
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            if count > 0 {
                                count -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: buttonFontSize))
                                .foregroundStyle(textColor)
                        }
                        .buttonStyle(.plain)
                        Spacer()
                        Button {
                            if count < maxCount{
                                count += 1
                            }
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: buttonFontSize))
                                .foregroundStyle(textColor)
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
