//
//  EmailLogin.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var Email : String = ""
    @State private var Password : String = ""
    @State private var Confirm : String = ""
    @State private var opacity : Double = 0.5
    
    
    var body: some View {
        VStack {
            Spacer().frame(height: 83)
            
            HStack {
                Spacer().frame(width: 16)
                
                Text("처음이시군요!\n회원가입 해주세요.")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 24)
                            .weight(.heavy)
                    )
                    .foregroundColor(.black)
                
                Spacer()
            }
            
            Spacer().frame(height: 36)
            
            //MARK: 개인정보
            Group {
                Login(text: $Email, name: "이메일", content: "이메일을 입력해주세요")
                    .onChange(of: Email) { newValue in
                        updateOpacity()
                    }
                
                Spacer().frame(height: 8)
                
                HStack {
                    Spacer().frame(width: 16)
                    
                    Text(verbatim : "Ex. hello2000@email.com")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 10)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                    
                    Spacer()
                }
                
                Spacer().frame(height: 16)
                
                Login(text: $Password, name: "비밀번호", content: "비밀번호를 입력해주세요")
                    .onChange(of: Password) { newValue in
                        updateOpacity()
                    }
                
                Spacer().frame(height: 8)
                
                HStack {
                    Spacer().frame(width: 16)
                    
                    Text("영문, 숫자, 특수기호(_ @ ? !) 조합 8자 이상")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 10)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                    
                    Spacer()
                }
                
                Spacer().frame(height: 16)
                
                Login(text: $Confirm, name: "비밀번호 확인", content: "비밀번호를 다시 한 번 입력해주세요")
                    .onChange(of: Confirm) { newValue in
                        updateOpacity()
                    }
            }
            
            Spacer()
            
            Group {
                HStack {
                    Spacer().frame(width: 19)
                    
                    HStack(alignment: .center, spacing: 10) {
                        Spacer()
                        
                        Text("회원가입")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.heavy)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .frame(height: 60, alignment: .center)
                    .background(Color(red: 0.94, green: 0.4, blue: 0.27).opacity(opacity))
                    .cornerRadius(20)
                    
                    Spacer().frame(width: 19)
                }
                
                Spacer().frame(height: 74)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: UIScreen.main.bounds.height)
        .navigationBarBackButtonHidden()
    }
    
    private func updateOpacity() {
        print("update")
        if !Email.isEmpty && !Password.isEmpty && !Confirm.isEmpty {
            opacity = 1.0
        } else {
            opacity = 0.5
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
