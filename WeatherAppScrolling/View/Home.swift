//
//  Home.swift
//  WeatherAppScrolling
//
//  Created by DONG SHENG on 2021/7/18.
//

import SwiftUI

struct Home: View {
    
    @State var offset: CGFloat = 0
    var topEdge : CGFloat
    
    var body: some View {
        ZStack{
            
            GeometryReader{ proxy in
                
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            
            .overlay(.ultraThinMaterial)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    VStack(alignment: .center, spacing: 5) {
                        
                        Text("Taiwan ,Taipei")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .padding(.bottom)
                        
                        Text("98°")
                            .font(.system(size: 45))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text("陰天")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text("H:30° L:35°")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                    }
                    .offset(y: -offset)
                    
                    //將天氣資訊的View 向下(上)拉 背景的即時資訊View高度也會跟著改變
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
                    VStack(spacing: 8) {
                        
                        CustomStackView {
                            //Label
                            Label {
                                Text("Hourly Forecast")
                            } icon: {
                                Image(systemName: "clock")
                            }

                        } contentView: {
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 15){
                                    
                                    ForecastView(time: "12 PM" , celcius: 94 , image: "sun.min")
                                    
                                    ForecastView(time: "1 PM" , celcius: 95 , image: "sun.haze")

                                    ForecastView(time: "2 PM" , celcius: 96 , image: "sun.min")

                                    ForecastView(time: "3 PM" , celcius: 97 , image: "cloud.sun")

                                    ForecastView(time: "4 PM" , celcius: 98 , image: "sun.haze")

                                }
                            }
                            
                        }
                        WeatherDataView()
                    }
                }
                .padding(.top ,25)
                .padding(.top, topEdge)
                .padding([.horizontal,.bottom])
                
                .overlay(
                
                    GeometryReader{ proxy -> Color in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return Color.clear
                    }
                )
            }
        }
    }
    func getTitleOpactiy()->CGFloat{
        
        let titleOffset = getTitleOffset()
        
        let progress = titleOffset / 15
        
        let opacity =  1 - progress
        
        return opacity
    }
    
    func getTitleOffset()-> CGFloat{
        
        if offset < 0 {
            let progress = -offset / 120
            
            let newOffset = (progress <= 1.0 ? progress : 1) * 20   //view 的位置 y軸 -10
            
            return -newOffset
        }
        
        return 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct ForecastView: View {
    
    var time: String
    var celcius: CGFloat
    var image: String
    
    var body: some View {
        VStack(spacing: 15){
            
            Text(time)
                .font(.callout.bold())
                .foregroundColor(.white)
            
            Image(systemName: image )
                .font(.title2)
            
                .symbolVariant(.fill)       // 圖示填滿
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow  , .white)
                .frame(height: 30)
            
            
            Text("\(Int(celcius))")
                .font(.callout.bold())
                .foregroundColor(.white)
        }
        .padding(.horizontal,10)
    }
}
