//
//  SignUpCView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/24.
//

import SwiftUI

struct SignUpCView: View {
    private var Email : String
    private var Password : String
    
    @EnvironmentObject var network : Network
    
    @State private var openPhoto : Bool = false
    @State private var image : UIImage = UIImage()
    @State private var isSelect : Bool = false
    @State private var selectedLanguage = "언어"
    @State private var name : String = ""
    @State private var language : String = ""
    @State private var opacity : Double = 0.5
    @State private var signUp : SignupResponse?
    @State private var userSignUpRequest = UserSignUpRequest()
    
    init(Email: String, Password : String) {
        self.Email = Email
        self.Password = Password
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 83)
                
                HStack {
                    Spacer().frame(width: 16)
                    
                    Text("반가워요 :)\n프로필을 설정해 주세요.")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 24)
                                .weight(.heavy)
                        )
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                
                //MARK: Profile Image
                Group {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        
                        if !image.isEmpty {
                            Image(uiImage: self.image)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                        }
                        else {
                            Image("Profile_photo")
                                .frame(width: 100, height: 100)
                        }
                        
                        Image("Button-Upload")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .aspectRatio(contentMode : .fit)
                            .offset(x : 37.5, y : 37.5)
                            .onTapGesture {
                                openPhoto = true
                            }
                    }
                    .frame(width: 100, height: 100, alignment: .center)
                }
                
                Spacer().frame(height: 36)
                
                Group {
                    Login(text: $name, name: "이름", content: "20자 이내로 입력해 주세요")
                        .onChange(of: name) { newValue in
                            updateOpacity()
                        }
                    Spacer().frame(height: 16)
                    Select(isSelect: $isSelect, name: "언어", content : selectedLanguage, imageName: "SelectArrow")
                        .onChange(of : language) { newValue in
                            updateOpacity()
                        }
                    Spacer().frame(height: 16)
                    
                    if isSelect {
                        List {
                            Text("영어")
                                .onTapGesture {
                                    language = "ENGLISH"
                                    isSelect = true
                                    selectedLanguage = "영어"
                                }
                            Text("베트남어")
                                .onTapGesture {
                                    language = "VIETNAMESE"
                                    isSelect = true
                                    selectedLanguage = "베트남어"
                                }
                            Text("중국어")
                                .onTapGesture {
                                    language = "CHINESE"
                                    isSelect = true
                                    selectedLanguage = "중국어"
                                }
                            Text("일본어")
                                .onTapGesture {
                                    language = "JAPANESE"
                                    isSelect = true
                                    selectedLanguage = "일본어"
                                }
                        }
                    }
                }
                
                Spacer()
                
                Group {
                    HStack {
                        Spacer().frame(width: 19)

                        Button(action: {
                            print("pressed")
                            userSignUpRequest.email = Email
                            userSignUpRequest.isOptionAgr = true
                            userSignUpRequest.language = language
                            userSignUpRequest.password = Password
                            userSignUpRequest.nickname = name
                            if !name.isEmpty && !language.isEmpty {
                                Network().SignUp(userRequest: userSignUpRequest, file: image) { 
                                    DispatchQueue.main.async {
                                        self.signUp = self.network.signUp
                                        if self.signUp == nil {
                                            print("signUp is nil")
                                        } else {
                                            if self.signUp!.isSuccess {
                                                print("isSuccess")
                                            }
                                        }
                                    }
                                }
                            }
                        },
                           label: {
                            Text("다음")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 18)
                                    .weight(.heavy)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        })
                        .frame(width: UIScreen.main.bounds.width - 38 ,height: 60, alignment: .center)
                        .background(Color(red: 0.94, green: 0.4, blue: 0.27).opacity(opacity))
                        .cornerRadius(20)
                        
                        Spacer().frame(width: 19)
                    }
                }
                
                Spacer().frame(height: 74)
                
            }
            .sheet(isPresented: $openPhoto) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(height: UIScreen.main.bounds.height)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func updateOpacity() {
        if !name.isEmpty && !language.isEmpty {
            opacity = 1.0
        }
        else {
            opacity = 0.5
        }
    }
}

struct SignUpCView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCView(Email: "email", Password: "password")
    }
}


extension UIImage {
    var isEmpty: Bool {
        guard let imageData = self.pngData() else {
            return true
        }
        return imageData.isEmpty
    }
}
