//
//  musicView.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI

struct musicView: View {
    @ObservedObject var playmusic: playMusic = playMusic()
    var body: some View
    {
        ScrollView(.horizontal) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 150.0, height: 150.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7058823529, green: 0.7254901961, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playmusic.play1 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playmusic.play1.toggle()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 150.0, height: 150.0)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7700955975, blue: 0.6383150062, alpha: 1)))
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playmusic.play1 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playmusic.play2.toggle()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 150.0, height: 150.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.6383150062, green: 0.886374713, blue: 1, alpha: 1)))
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playmusic.play1 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playmusic.play3.toggle()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 150.0, height: 150.0)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9598226599, blue: 0.6383150062, alpha: 1)))
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                    Circle()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                    Image(systemName: playmusic.play1 ? "pause" : "play")
                        .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        .animation(.default)
                }.onTapGesture {
                    playmusic.play4.toggle()
                }
            }.padding(.horizontal)
        }
    }
}

struct musicView_Previews: PreviewProvider {
    static var previews: some View {
        musicView()
    }
}
