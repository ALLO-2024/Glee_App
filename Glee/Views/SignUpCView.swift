//
//  SignUpCView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/24.
//

import SwiftUI

struct SignUpCView: View {
    @State private var openPhoto : Bool = false
    @State private var image : UIImage = UIImage()
    @State private var isSelect : Bool = false
    @State private var isSearch : Bool = false
    @State private var selectedLanguage = "언어"
    @State private var name : String = ""
    @State private var school : String = ""
    @State private var language : String = ""
    
    var body: some View {
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
                Spacer().frame(height: 16)
                Select(isSelect: $isSelect, name: "언어", content : selectedLanguage, imageName: "SelectArrow")
                Spacer().frame(height: 16)
                
                if isSelect {
                    List {
                        Text("영어")
                            .onTapGesture {
                                language = "ENGLISH"
                                isSelect.toggle()
                                selectedLanguage = "영어"
                            }
                        Text("베트남어")
                            .onTapGesture {
                                language = "VIETNAMESE"
                                isSelect.toggle()
                                selectedLanguage = "베트남어"
                            }
                        Text("중국어")
                            .onTapGesture {
                                language = "CHINESE"
                                isSelect.toggle()
                                selectedLanguage = "중국어"
                            }
                        Text("일본어")
                            .onTapGesture {
                                language = "JAPANESE"
                                isSelect.toggle()
                                selectedLanguage = "일본어"
                            }
                    }
                }
                
                //Select(isSelect: $isSearch, name: "학교", content: selectedLanguage, imageName: "SelectArrow")
            }
            
        }
        .sheet(isPresented: $openPhoto) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: UIScreen.main.bounds.height)
        .navigationBarBackButtonHidden()
    }
}

struct SignUpCView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCView()
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
