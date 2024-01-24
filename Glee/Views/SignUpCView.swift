//
//  SignUpCView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/24.
//

import SwiftUI

struct SignUpCView: View {
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
            
            ZStack {
                Image("Profile_photo")
                    .frame(width: 37.5, height: 37.5)
            }
            .padding(6)
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(500)
            
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
