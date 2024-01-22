//
//  DataStructs.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/19.
//

import Foundation
import SwiftUI

//MARK: BackButton
struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View {
        Button (action : {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image("BackButton")
                .frame(width: 24, height: 24)
        }
    }
}

//MARK: ToolBar
struct ToolBarTail : View {
    @Binding var isSearchBarVisible : Bool
    
    var body : some View {
        HStack {
            Button(action: {
                withAnimation {
                    isSearchBarVisible.toggle()
                }
            }, label: {
                Image("Search")
                    .frame(width: 24, height: 24)
            })
            Spacer().frame(width: 12)
            
            Button(action: {
                withAnimation {
                    isSearchBarVisible.toggle()
                }
            }, label: {
                Image("Download")
                    .frame(width: 24, height: 24)
            })
        }
    }
}

//MARK: Search
struct SearchBar : View {
    @State var word : String = ""
    
    var body: some View {
        HStack {
            Spacer().frame(width: 16)
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.97, green: 0.97, blue: 0.97))
                    .cornerRadius(10)
                HStack {
                    Spacer().frame(width: 16)
                    
                    Image("Search_Gray")
                        .frame(width: 24, height: 24)
                    
                    Spacer().frame(width: 10)
                    
                    TextField("단어를 검색해 주세요", text: $word)
                }
            }
            Spacer().frame(width: 16)
        }
        .frame(height: 40)
    }
}

//MARK: simpleText

struct simpleText : View {
    var categoty : String
    var size : CGFloat
    @Binding var isChoice : Bool
    
    var body: some View {
        VStack {
            if isChoice {
                Text(categoty)
                    .font(
                    Font.custom("Apple SD Gothic Neo", size: 16)
                    .weight(.bold)
                    )
                    .foregroundColor(.black)
                
                Spacer().frame(height: 8)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: size, height: 2)
                    .background(Color(red: 0.94, green: 0.4, blue: 0.27))
            }
            else {
                Text(categoty)
                    .font(
                    Font.custom("Apple SD Gothic Neo", size: 16)
                    .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73))
                
                Spacer().frame(height: 8)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: size, height: 2)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            }
        }
    }
}

//MARK: Language
