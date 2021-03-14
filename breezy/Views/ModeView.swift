//
//  Mode.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI

struct ModeView: View {
    @ObservedObject var modeldata: modelData = modelData()
    let data: modeData
//    var option: OptionView = OptionView()
    
    
    var body: some View {
        
        let animation = Animation.easeOut(duration: data.timer).delay(1.0).repeatForever(autoreverses: true)
        let notification = UINotificationFeedbackGenerator()
        let haptic = UIImpactFeedbackGenerator()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        let MC = Color(#colorLiteral(red: 0.5998574835, green: 0.6335702024, blue: 0.8493316028, alpha: 1))
        let FG = Color(#colorLiteral(red: 0.5592982323, green: 0.6541702143, blue: 0.7317927452, alpha: 1))
        let BG = Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1))
        var time = data.timer
        let time1 = data.timer
        
        ZStack {
            BG.ignoresSafeArea()
            VStack {
                Spacer()
                Text(modeldata.breath ? "Выдох":"Вдох")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(FG)
                    .padding(.vertical, 50.0)
                    .opacity(modeldata.isOn ? 1.0 : 0)
                    .animation(.default)
                Spacer()
                ZStack {
                    ZStack{
                        let randomDouble1 = Double.random(in: 1...360)
                        let randomDouble2 = Double.random(in: 1...360)
                        let randomDouble3 = Double.random(in: 1...360)
                   Capsule()
                        .frame(width: 150.0, height: 125.0)
                        .foregroundColor(MC)
                        .rotationEffect(.degrees(randomDouble1))
                        .opacity(0.5)
                        .scaleEffect(modeldata.isOn ? 1.11 : 1.0 )
                        .animation(modeldata.isOn ? animation : .default)
                    Capsule()
                        .frame(width: 150.0, height: 140.0)
                        .foregroundColor(MC)
                        .opacity(0.4)
                        .scaleEffect(modeldata.isOn ? 1.13 : 1.0 )
                        .rotationEffect(.degrees(randomDouble2))
                        .animation(modeldata.isOn ? animation : .default)
                    Capsule()
                        .frame(width: 150.0, height: 100.0)
                        .foregroundColor(MC)
                        .opacity(0.3)
                        .scaleEffect(modeldata.isOn ? 1.12 : 1.0 )
                        .rotationEffect(.degrees(randomDouble3))
                        .animation(modeldata.isOn ? animation : .default)
                    }
                    Circle()
                        .frame(width: 150.0, height: 150.0)
                        .foregroundColor(MC)
                }
                .scaleEffect(modeldata.isOn ? 1.4 : 1.0 )
                .animation(modeldata.isOn ? animation : .default)
                .onReceive(timer, perform: { _ in
                    
                    
                    if modeldata.isOn == true{
                        
                        if time > 0{
                            print(time)
                            time -= 1
                        }else{
                            notification.notificationOccurred(.success)
                            modeldata.breath.toggle()
                            
                            print("бжык")
                            time = time1
                        }
                    }else{
                        time = time1
                        
                    }
                })
                .onTapGesture {
                    modeldata.isOn.toggle()
                    haptic.impactOccurred()
                    modeldata.breath = false
                    print(modeldata.isOn)
//                    option.changeTimer()
//                    option.startTimer()
//                    OptionView().startTimer()
//                    print("\(OptionView().timeMin):\(OptionView().timeSec)")
                }
            Spacer()
            Spacer()
            Spacer()
            }
        }
    }
}

struct Mode_Previews: PreviewProvider {
    static var data = modeData.data[0]
    static var previews: some View {
        ModeView(data: data)
    }
}
