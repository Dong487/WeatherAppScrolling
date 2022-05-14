//
//  WeatherDataView.swift
//  WeatherAppScrolling
//
//  Created by DONG SHENG on 2021/7/25.
//

import SwiftUI

struct WeatherDataView: View {
    var body: some View {
        
        VStack(spacing: 8){
            
            CustomStackView {
                
                Label {
                    Text("Air Quality")
                } icon: {
                    Image(systemName: "circle.hexagongrid.fill")
                }

            } contentView: {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("143 - Moderately Polluted")
                        .font(.title3.bold())
                    
                    Text("3123213132132131232132132")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
            }

            HStack{
                
                CustomStackView {
                      
                    Label {
                        Text("UV 紫外線強度")
                    } icon: {
                        Image(systemName: "sun.min")
                    }

                } contentView: {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Low")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity ,maxHeight: .infinity ,alignment: .leading)
                }
                
                
                CustomStackView {
                    
                  Label {
                      Text("降雨量")
                  } icon: {
                      Image(systemName: "drop.fill")
                  }
                      
                } contentView: {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("0 mm")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("未來 24 小時..")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)
            CustomStackView {
                
                Label {
                    Text("未來10天預測")
                } icon: {
                    Image(systemName: "calendar")
                }

            } contentView: {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(forecast){ cast in
                        
                        VStack {
                            HStack(spacing: 15){
                                
                                Text(cast.day)
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                                    .frame(width: 60 ,alignment: .leading)
                                
                                Image(systemName: cast.imagr)
                                    .font(.title3)
                                    .symbolVariant(.fill)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.yellow, .white)
                                    .frame(width: 30)
                                
                                
                                //最低溫
                                Text("\(Int(cast.farenheit) - 8)°C")
                                    .font(.title3.bold())
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(.white)
                                
                                ZStack(alignment: .leading) {
                                    //
                                    //空的背景
                                    Capsule()
                                        .fill(.tertiary)
                                        .foregroundStyle(.white)
                                    
                                    GeometryReader{ proxy in
                                        
                                        Capsule()
                                            .fill(.linearGradient(.init(colors: [.orange , .red]), startPoint: .leading, endPoint: .trailing))
                                            .frame(width: (cast.farenheit / 50) * proxy.size.width )
                                        
                                    }
                                }
                                .frame(height: 7)
                                
                                //最高溫
                                //可以更改為降雨機率
                                Text("\(Int(cast.farenheit))")
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                            }
                            
                            Divider()
                        }
                        .padding(.vertical, 8)
                    }
                }
            }

        }
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
