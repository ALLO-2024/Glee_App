//
//  SignIn.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/22.
//

import SwiftUI

struct LoginEmailView: View {
    @State private var Email : String = ""
    @State private var Password : String = ""
    @State private var opacity : Double = 0.5
    @State private var isError : Bool = false
    @State private var warning : String = "존재하지 않는 이메일입니다."
    
    var body: some View {
        VStack {
            Spacer().frame(height: 83)
            
            HStack {
                Spacer().frame(width: 16)
                
                Text("반가워요 :)\n로그인 해주세요")
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 24)
                            .weight(.heavy)
                    )
                    .foregroundColor(.black)
                
                Spacer()
            }
            
            Spacer().frame(height: 36)
            
            //MARK: email, password
            Group {
                VStack {
                    Login(text: $Email, name: "이메일", content: "이메일을 입력해 주세요")
                        .onChange(of: Email) { newValue in
                            updateOpacity()
                        }
                    
                    
                    Spacer().frame(height: 16)
                    
                    Login(text: $Password, name: "비밀번호", content: "비밀번호를 입력해 주세요")
                        .onChange(of: Password) { newValue in
                            updateOpacity()
                        }
                    
                    if isError {
                        Spacer().frame(height: 17)
                        
                        HStack {
                            Spacer().frame(width: 16)
                            
                            Image("Warning")
                                .frame(width: 12, height: 12)
                            
                            Text(warning)
                              .font(
                                Font.custom("Apple SD Gothic Neo", size: 12)
                                  .weight(.medium)
                              )
                              .foregroundColor(Color(red: 0.94, green: 0.04, blue: 0.04))
                            
                            Spacer()
                        }
                    }
                }
            }
            
            Spacer()
            
            Text("아이디 혹은 비밀번호를 잊으셨나요?")
              .font(
                Font.custom("Apple SD Gothic Neo", size: 12)
                  .weight(.semibold)
              )
              .underline()
              .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
            
            Spacer().frame(height: 32)
            
            Group {
                Button(action: {
                    print("Email = \(Email), password = \(Password)")
                }, label: {
                    HStack {
                        Spacer().frame(width: 19)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Spacer()
                            
                            Text("로그인")
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
                })
            }
            
            Spacer().frame(height: 74)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: UIScreen.main.bounds.height)
        .navigationBarBackButtonHidden()
    }
    
    private func updateOpacity() {
        print("update")
        if !Email.isEmpty && !Password.isEmpty {
            opacity = 1.0
        } else {
            opacity = 0.5
        }
    }
}

struct LoginEmail_PreiView: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
    }
}
