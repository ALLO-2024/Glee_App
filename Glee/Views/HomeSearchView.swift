//
//  HomeSearchView.swift
//  Glee
//
//  Created by 최재혁 on 2024/02/01.
//

import SwiftUI

struct HomeSearchView: View {
    @State private var word = ""
    
    var body: some View {
        VStack {
            Spacer().frame(height: 14)
            
            HStack {
                Spacer().frame(width: 19)
                
                HStack(alignment: .center, spacing: 10) {
                    Image("Search_Gray")
                        .frame(width: 15.99939, height: 16)
                    
                    TextField("노트 제목을 검색해 주세요", text: $word)
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 14)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                .frame(height: 52, alignment: .leading)
                .background(.white)
                .cornerRadius(20)
                
                Spacer().frame(width: 19)
            }
            
            Spacer()
        }
        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    BackButton()
                }
            }
        }
    }
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchView()
    }
}
