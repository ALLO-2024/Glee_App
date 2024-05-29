//
//  ContentView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/15.
//

import SwiftUI

struct ContentView: View {
    @State private var position : Int = 0
    private var mentions : [String] = ["대충 설명\n두줄 정도", "대충 설명\n두줄 정도2", "대충 설명\n두줄 정도3"]
    private var colors = [[Color(#colorLiteral(red: 0.6156862745, green: 0.6156862745, blue: 0.6156862745, alpha: 1.0)), Color(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)), Color(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1))],
                          [Color(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)), Color(#colorLiteral(red: 0.6156862745, green: 0.6156862745, blue: 0.6156862745, alpha: 1.0)), Color(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1))],
                          [Color(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)), Color(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)), Color(#colorLiteral(red: 0.6156862745, green: 0.6156862745, blue: 0.6156862745, alpha: 1.0)),]]
    @State private var offset: CGFloat = 0.0
    @State private var isSlideComplete : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 134)
                Text("공부를 더 쉽게,\n글리에서")
                    .frame(height: 81)
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 32)
                            .weight(.heavy)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.bottom, 34)
                
                //MARK: Slid
                VStack {
                    VStack {
                        Text(mentions[position])
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.semibold)
                            )
                            .frame(width: UIScreen.main.bounds.width)
                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .gesture(DragGesture()
                        .onChanged { value in
                            withAnimation {
                                offset = value.translation.width
                            }
                        }
                        .onEnded { value in
                            withAnimation{
                                if offset > 0 && position != 2 {
                                    self.position += 1
                                }
                                else if offset < 0 && position != 0 {
                                    self.position -= 1
                                }
                                offset = 0
                                print("position : \(position)")
                            }
                            
                        }
                    )
                    
                    HStack {
                        Spacer()
                        
                        ForEach(0..<colors[position].count, id: \.self) { index in
                            Circle()
                                .frame(height: 8)
                                .foregroundColor(colors[position][index])
                            
                        }
                        
                        Spacer()
                    }
                }
                .frame(height: UIScreen.main.bounds.height/2)
                
                Spacer().frame(height: 83)
                NavigationLink(destination : LoginView().navigationBarBackButtonHidden(true)) {
                    HStack {
                        Spacer().frame(width: 19)
                        
                        HStack {
                            Spacer()
                            
                            Text("바로 시작하기")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.heavy)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(height: 60)
                            
                            Spacer()
                        }
                        .background(Color(red: 0.94, green: 0.4, blue: 0.27))
                        .cornerRadius(20)
                        
                        Spacer().frame(width: 19)
                    }
                }
                
                Spacer().frame(height: 54)
                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(height: UIScreen.main.bounds.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
