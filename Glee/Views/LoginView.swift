//
//  LoginView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/17.
//

import SwiftUI

struct LoginView: View {
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
                        Text("외국인 유학생들을 위한\n 한국어 학습 도우미")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .frame(width: UIScreen.main.bounds.width)
                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    }
                    .contentShape(Rectangle())
                    
                    Image("App_Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 250)
                    
                    Spacer().frame(height: 150)
                }
                
                Group {
                    HStack (spacing: 24){
                        Spacer()
                        
                        Button(action : {
                            for fontFamily in UIFont.familyNames {
                                for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
                                    print(fontName)
                                }
                            }
                        }, label: {
                            Image("Kakao")
                        })
                        
                        Button(action : {
                            
                        }, label: {
                            Image("Naver")
                        })
                        
                        Button(action : {
                            
                        }, label: {
                            Image("Google")
                        })
                        
                        Button(action : {
                            
                        }, label: {
                            Image("Apple")
                        })
                        
                        Spacer()
                    }
                }
                
                Spacer().frame(height: 35)
                
                HStack(spacing: 24) {
                    NavigationLink(destination : SignUp()) {
                        Text("이메일 회원가입")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    }
                    
                    Text("|")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 14)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    NavigationLink(destination : LoginEmail()) {
                        Text("이메일 로그인")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    }
                }
                
                Spacer().frame(height: 95)
                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(height: UIScreen.main.bounds.height)
            .navigationBarBackButtonHidden()
        }
    }
}


struct Login_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
