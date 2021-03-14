//
//  BarView.swift
//  breezy
//
//  Created by Тема Двачевский on 09.03.2021.
//

import SwiftUI

struct BarView: View {
    
    @ObservedObject var modeldata: modelData = modelData()
    init(_ datas: [modeData]) {
        UITabBar.appearance().isHidden = true
        self.datas = datas
    }
    @State var selectedtab = "home1"
    @State var xAxis: CGFloat = 0
    let haptic = UISelectionFeedbackGenerator()
    
    var datas: [modeData]
    @Namespace var animation
    
    var body: some View {
        
        let MC = Color(#colorLiteral(red: 0.5998574835, green: 0.6335702024, blue: 0.8493316028, alpha: 1))
        let FG = Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1))
        let BG = Color(#colorLiteral(red: 0.7725490196, green: 0.8156862745, blue: 0.8509803922, alpha: 1))
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom))
        {
            
                TabView(selection: $selectedtab)
                {
                    ForEach(datas) { data in
                        ModeView(data: data)
                            .ignoresSafeArea(.all,edges: .all)
                            .tag(data.icon)
                    }
                }
                HStack(spacing:0) {
                    ForEach(datas) { data in
                        GeometryReader{reader in
                            Button(action:{
                                withAnimation(.spring()){
                                    selectedtab = data.icon
                                    xAxis = reader.frame(in: .global).minX
                                    
                                    print("тап бар")
                                    modeldata.isOn = false
                                    haptic.selectionChanged()
                                }
                            },label:{
                                Image(data.icon)
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(selectedtab == data.icon ? MC : FG)
                                    .padding(selectedtab == data.icon ? 15 : 0)
                                    .background(BG.opacity(selectedtab == data.icon ? 1 : 0).clipShape(Circle()))
                                    .matchedGeometryEffect(id: data.icon, in: animation)
                                    .offset(x: selectedtab == data.icon ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0,y: selectedtab == data.icon ? -50 : 0)
                            })
                        
                        .onAppear(perform: {
                            if data.icon == tabs.first{
                                    xAxis = reader.frame(in: .global).minX
                                }
                        })
                        }
                        .frame(width: 25, height: 30)
                        
                        if data.icon != tabs.last{Spacer(minLength: 0)}
                    }
                }
                .padding(.horizontal,30)
                .padding(.vertical)
                .background(BG.clipShape(CustomShape(xAxis: xAxis)).cornerRadius(30))
                .padding(.horizontal)
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            }
            .ignoresSafeArea(.all,edges: .bottom)
            
        
    }
}

var tabs = ["home1","home2","home3","home4"]

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(modeData.data)
    }
}
