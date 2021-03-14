//
//  OptionView.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI

struct OptionView: View {
    @ObservedObject var timeClass: TimerClass = TimerClass()
    @ObservedObject var modeldata: modelData = modelData()
    @State var selection = 2
    private var timeArray = ["30s","1m","2m","5m","10m","15m","20m"]
    
    
    
    var body: some View {
        
        ZStack{
            ZStack {
                VStack{
                    HStack{
                        Spacer()
                        Text("\(timeClass.timeMin):\(timeClass.timeSec)")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                            .animation(.default)
                            .padding(.leading, 63.0)
                            
                        Spacer()
                        settingButton()
                    }.padding([.top, .trailing], 25.0)
                    Spacer()
//                    Circle()
//                        .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .opacity(0.001)
//                        .onTapGesture {
//                            timeClass.startTimer()
//                        }
                }
                VStack{
                ZStack {
                    HStack {
                        Spacer()
                        Text("Options")
                                .font(.title2)
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                        Spacer()
                    }.padding([.top], 15.0)
                }
                 VStack {
                    Text("timer:")
                        .font(.title2)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.top, 5.0)
                    Picker(selection: $selection, label: Text("")) {
                        ForEach(0 ..< timeArray.count) {
                            Text(self.timeArray[$0])
                                .foregroundColor(.white)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selection) { selection in
                        timeClass.changeTimer()
                        self.selection = selection
                    }
                 }.padding(.horizontal)
                VStack {
                    HStack {
                        Spacer()
                        Text("sounds:")
                            .font(.title2)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    soundView()
                }
                VStack {
                    HStack {
                        Spacer()
                        Text("music:")
                            .font(.title2)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    musicView()
                }
                Spacer()
                
              }
                .background(timeClass.timerShow ? Color.init(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)): Color.clear)
                .frame(height: 550)
                .cornerRadius(30)
                .padding()
                .opacity(timeClass.timerShow ? 1:0)
                VStack {
                    HStack{
                        ZStack {
                            Circle()
                                .frame(width: 40.0, height: 40.0)
                                .foregroundColor(timeClass.timerShow ? Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)):Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
                            Image(systemName: timeClass.timerShow ? "xmark":"timer")
                                .resizable()
                                .frame(width: timeClass.timerShow ? 20.0 : 30.0, height:timeClass.timerShow ? 20.0 : 30.0)
                                .foregroundColor(timeClass.timerShow ? Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)):Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
                        }
                        .animation(.spring())
                        .onTapGesture {
                            timeClass.timerShow.toggle()
                            timeClass.changeTimer()
                            print("\(timeClass.timeMin):\(timeClass.timeSec)")
                            if timeClass.timerShow == false{
                                modeldata.isOn = true
                            }
                        }
                    Spacer()
                    }
                    Spacer()
                }.padding([.top, .leading], 25.0)
            }
            .frame(height: 550)
            
            

        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
    }
}
