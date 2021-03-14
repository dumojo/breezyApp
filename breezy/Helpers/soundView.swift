//
//  soundView.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI

struct soundView: View {
    @ObservedObject var playsound: playSound = playSound()
    var body: some View
    {
        ScrollView(.horizontal) {
            HStack {
                ZStack {
                    Image("forest")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(30)
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playsound.play1 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playsound.play1.toggle()
                }
                ZStack {
                    Image("waterfall")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(30)
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playsound.play2 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playsound.play2.toggle()
                }
                ZStack {
                    Image("morning")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(30)
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playsound.play3 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playsound.play3.toggle()
                }
                ZStack {
                    Image("forest")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(30)
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playsound.play4 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playsound.play4.toggle()
                }
            }.padding(.horizontal)
        }
    }
}


struct soundView_Previews: PreviewProvider {
    static var previews: some View {
        soundView()
    }
}
