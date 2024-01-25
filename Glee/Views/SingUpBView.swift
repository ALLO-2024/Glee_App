//MARK: NavigationStack 사용필요

import SwiftUI

struct SingUpBView: View {
    @State private var all : Bool = false
    @State private var age : Bool = false
    @State private var personal : Bool = false
    @State private var service : Bool = false
    @State private var advertisement : Bool = false
    @State private var imageName : String = "Check_Gray"
    @State private var opacity : Double = 0.5
    @State private var allColor : Color = Color(red: 0.38, green: 0.38, blue: 0.38)
    
    private var colors : [Color] = [Color(red: 0.38, green: 0.38, blue: 0.38), Color(red: 0.94, green: 0.4, blue: 0.27)]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 83)
                
                HStack {
                    Spacer().frame(width: 16)
                    
                    Text("시작하기에 앞서, \n약관 내용에 동의해 주세요.")
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 24)
                                .weight(.heavy)
                        )
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                
                Spacer().frame(height: 36)
                
                //MARK: 모두 동의하기
                Group {
                    HStack {
                        Spacer().frame(width: 16)
                        
                        HStack(alignment: .center, spacing: 12) {
                            Image(imageName)
                                .frame(width: 16.73665, height: 16)
                            
                            Spacer().frame(width: 12.63)
                            
                            Text("모두 동의하기")
                                .font(
                                    Font.custom("Apple SD Gothic Neo", size: 14)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .frame(height: 52, alignment: .leading)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(allColor, lineWidth: 1)
                        )
                        Spacer().frame(width: 16)
                    }
                    .onTapGesture {
                        all.toggle()
                        
                        if all {
                            allColor = colors[1]
                            personal = true
                            service = true
                            age = true
                            advertisement = true
                            imageName = "Check_Orange"
                        }
                        else {
                            allColor = colors[0]
                            personal = false
                            service = false
                            age = false
                            advertisement = false
                            imageName = "Check_Gray"
                        }
                        
                        updateOpacity()
                    }
                }
                
                Spacer().frame(height: 38)
                
                //MARK: 동의사항
                Group {
                    VStack (spacing : 24){
                        Agree(agree: $age, content: "만 14세 이상입니다 (필수)")
                            .onTapGesture {
                                age.toggle()
                                updateOpacity()
                            }
                        HStack {
                            Agree(agree: $service, content: "서비스 이용약관에 동의 (필수)")
                                .onTapGesture {
                                    service.toggle()
                                    updateOpacity()
                                }
                            
                            Text("전체 보기")
                              .font(
                                Font.custom("Apple SD Gothic Neo", size: 10)
                                  .weight(.medium)
                              )
                              .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                            
                            Spacer().frame(width: 16)
                        }
                        
                        HStack {
                            Agree(agree: $personal, content: "개인정보 수집 및 이용에 동의 (필수)")
                                .onTapGesture {
                                    personal.toggle()
                                    updateOpacity()
                                }
                            
                            Text("전체 보기")
                              .font(
                                Font.custom("Apple SD Gothic Neo", size: 10)
                                  .weight(.medium)
                              )
                              .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                            
                            Spacer().frame(width: 16)
                        }
                        
                        HStack {
                            Agree(agree: $advertisement, content: "광고 및 마케팅 수신에 동의 (선택)")
                                .onTapGesture {
                                    advertisement.toggle()
                                    updateOpacity()
                                }
                            
                            Text("전체 보기")
                              .font(
                                Font.custom("Apple SD Gothic Neo", size: 10)
                                  .weight(.medium)
                              )
                              .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                            
                            Spacer().frame(width: 16)
                        }
                    }
                }
                
                Spacer()
                
                //MARK: Button -> navigationStack으로 수정할 필요 있다
                Group {
                    NavigationLink(destination: SignUpCView(), isActive: Binding<Bool>(get : {
                        return age && service && personal
                    }, set : {newValue in }),label: {
                        HStack {
                            Spacer().frame(width: 19)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Spacer()
                                
                                Text("다음")
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
    }
    
    private func updateOpacity() {
        if age && service && personal {
            if advertisement {
                all = true
                imageName = "Check_Orange"
                allColor = colors[1]
            }
            else {
                imageName = "Check_Gray"
                allColor = colors[0]
            }
            opacity = 1.0
        } else {
            opacity = 0.5
            imageName = "Check_Gray"
            allColor = colors[0]
        }
    }
}

struct SinUpBView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpBView()
    }
}
