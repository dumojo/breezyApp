//
//  settingButton.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI

struct settingButton: View {
    var body: some View {
        
        ZStack {
            Circle()
                .frame(width: 40.0, height: 40.0)
                .foregroundColor(Color.init(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1)))
            HStack {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1)))
            }
        }
    }
}

struct settingButton_Previews: PreviewProvider {
    static var previews: some View {
        settingButton()
    }
}
