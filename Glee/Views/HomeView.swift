//
//  MainView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/17.
//

import SwiftUI

struct HomeView: View {
    private var Category : [String] = ["교양", "전공"]
    private var WordType : [String] = ["n", "v"]
    @State private var Kor : [String] = ["전략", "제공하다", "플랫폼"]
    @State private var Eng : [String] = ["Strategy", "Supply", "Platfrom"]
    @State private var WordTypes : [Int] = [0, 1, 0]
    
    var body: some View {
        NavigationView {
            VStack (spacing : 0){
                Spacer().frame(height: 47)
                
                //MARK: Navigation
                Group {
                    HStack{
                        Spacer().frame(width: 16)
                        
                        Text("Glee")
                            .font(
                                Font.custom("Poppins", size: 24)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color(red: 0.94, green: 0.4, blue: 0.27))
                        
                        Spacer()
                        
                        Image("Profile")
                            .frame(width: 25, height: 25)
                        
                        Spacer().frame(width: 16)
                    }
                }
                
                Spacer().frame(height: 16)
                
                Group{
                    VStack {
                        HStack {
                            Spacer().frame(width: 16)
                            
                            HStack {
                                Spacer()
                            }
                            .frame(height: 88)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.78, green: 0.84, blue: 0.92), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0.79, green: 0.92, blue: 0.78), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.95, y: 1.32),
                                    endPoint: UnitPoint(x: 1.1, y: -0.7)
                                )
                            )
                            .cornerRadius(8)
                            
                            Spacer().frame(width: 16)
                        }
                        
                        HStack {
                            Spacer().frame(width: 16)
                            
                            Text("북마크한 단어")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 18)
                                        .weight(.bold)
                                )
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        
                        Spacer().frame(height: 8)
                        
                        HStack {
                            Spacer().frame(width: 16)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(0..<Kor.count) { num in
                                        VStack(alignment: .leading, spacing: 8) {
                                            HStack {
                                                Text(Kor[num])
                                                    .font(
                                                        Font.custom("Apple SD Gothic Neo", size: 14)
                                                            .weight(.semibold)
                                                    )
                                                    .foregroundColor(.black)
                                                
                                                Spacer()
                                                
                                                Image("BookMarked")
                                                    .frame(width: 7.97993, height: 10.24)
                                            }
                                            
                                          HStack {
//                                                Text(WordTypes[WordType[num]])
//                                                    .font(
//                                                        Font.custom("Apple SD Gothic Neo", size: 6)
//                                                            .weight(.heavy)
//                                                    )
//                                                    .multilineTextAlignment(.center)
//                                                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
//                                                    .frame(width: 8, height: 8, alignment: .center)
                                          }
                                            
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 0)
                                        .frame(width: 160, height: 92, alignment: .leading)
                                        .background(.white)
                                        .cornerRadius(20)
                                    }
                                }
                            }
                        }
                    }
                }
                
                Spacer().frame(height: 26)
            
                //MARK: Scroll Control
                HStack {
                    Spacer().frame(width: 16)
                    
                    Text("24년 1학기")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 18)
                                .weight(.bold)
                        )
                        .foregroundColor(.black)
                    
                    Spacer().frame(width: 8)
                    
                    Button(action: {
                        
                    }, label: {
                        Image("SelectArrow")
                            .frame(width: 14, height: 14)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("Search")
                            .frame(width: 14, height: 14)
                    })
                    
                    Spacer().frame(width: 20)
                    
                    Button(action: {
                        
                    }, label: {
                        Image("Calender")
                            .frame(width: 14, height: 14)
                    })
                    
                    Spacer().frame(width: 16)
                }
                
                Spacer().frame(height: 8)
                
                //MARK: Scroll View
                ScrollView(.vertical, showsIndicators: false) {
                    NavigationLink(destination : NoteRecordView()) {
                        HStack{
                            Spacer().frame(width: 19)
                            
                            VStack (alignment: .leading, spacing: 8){
                                Text(Category[0])
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 10)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.94, green: 0.4, blue: 0.27))
                                
                                Text("미디어 비즈니스론 13주차 2차시 수업")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.black)
                                
                                Text("2024. 11. 25 오후 3:34 • 34분 17초")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 12)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("미디어 기업")
                                            .font(
                                                Font.custom("Apple SD Gothic Neo", size: 10)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(Color(red: 0.29, green: 0.29, blue: 0.29))
                                        
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 6)
                                    .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                                    .cornerRadius(10)
                                    
                                    Spacer()
                                }
                                
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 16)
                            .background(.white)
                            .cornerRadius(20)
                            
                            Spacer().frame(width: 19)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                
                HStack {
                    Spacer().frame(width: 42)
                    
                    Button(action: {
                        
                    }, label: {
                        Image("Button-Main")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("Button-Upload")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("Button-Community")
                    })
                    
                    Spacer().frame(width: 40.92)
                }
                .frame(height: 92)
                .overlay(Rectangle()
                    .inset(by: 0.1)
                    .stroke(Color(red: 0.73, green: 0.73, blue: 0.73), lineWidth: 0.2)
                         
                )
                
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden()
            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
        }
    }
}


struct Main_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
