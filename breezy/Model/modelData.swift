//
//  modelData.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import Foundation
import Combine

struct modeData: Hashable, Codable, Identifiable {
    let id: Int
    var icon: String
    var timer: Double
}
extension modeData {
    static var data: [modeData]{
        [
             modeData(
                 id: 1,
                 icon: "home1",
                 timer: 4
             ),
             modeData(
                 id: 2,
                 icon: "home2",
                 timer: 3
             ),
             modeData(
                 id: 3,
                 icon: "home3",
                 timer: 2
             ),
             modeData(
                 id: 4,
                 icon: "home4",
                 timer: 1
             )
         ]
    }
}

final class modelData: ObservableObject {
    
    @Published var isOn = false
    @Published var breath = false
   
}

class playSound: ObservableObject {
    @Published var play1 = false
    @Published var play2 = false
    @Published var play3 = false
    @Published var play4 = false
}

class playMusic: ObservableObject {
    @Published var play1 = false
    @Published var play2 = false
    @Published var play3 = false
    @Published var play4 = false
   
}

class TimerClass: ObservableObject {
    @Published var timeMin: Int = 0
    @Published var timeSec: Int = 0
    @Published var timerShow: Bool = false
    @Published var timerPlay: Bool = true
    @Published var timer: Timer? = nil
    @Published var selection = 2
    
    func changeTimer(){
    
        switch self.selection {
        case 0:
            self.timeMin = 0
            self.timeSec = 30
        case 1:
            self.timeMin = 1
            self.timeSec = 0
        case 2:
            self.timeMin = 2
            self.timeSec = 0
        case 3:
            self.timeMin = 5
            self.timeSec = 0
        case 4:
            self.timeMin = 10
            self.timeSec = 0
        case 5:
            self.timeMin = 15
            self.timeSec = 0
        case 6:
            self.timeMin = 20
            self.timeSec = 0
        default:
            self.timeMin = 2
            self.timeSec = 0
        }
    }
    func stopTimer(){
        timerPlay = true
        timer?.invalidate()
        timer = nil
      }
    func startTimer(){
        timerPlay = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.timeSec == 0{
                if self.timeMin == 0{
                    self.timerPlay = true
                }else{
                    self.timeMin = self.timeMin - 1
                    self.timeSec = 59
                }
            }else{
                self.timeSec = self.timeSec - 1
            }
         }
      }
}
