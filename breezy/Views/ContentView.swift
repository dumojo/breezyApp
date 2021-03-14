//
//  ContentView.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let datas: [modeData]
    
   var body: some View {
    ZStack {
        BarView(datas)
        VStack {
            OptionView()
             Spacer()
        }
    }
   }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(datas: modeData.data)
    }
}
