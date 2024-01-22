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
struct Language : View{
    var language : String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 16)
            
            Circle()
                .frame(width: 6,height: 6)
                .foregroundColor(Color(red: 0.94, green: 0.4, blue: 0.27))
            
            Text(language)
                .font(
                Font.custom("Apple SD Gothic Neo", size: 14)
                .weight(.bold)
                )
                .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
            Spacer()
        }
    }
}

//MARK: Login
struct Login : View {
    @Binding var text : String
    @State var input : String = ""
    var name : String
    var content : String
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0) {
                Text(name)
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
            }
            .padding(.leading, 0)
            .padding(.trailing, 316)
            .padding(.vertical, 0)
            .frame(height: 19, alignment: .leading)
            
            Spacer().frame(height: 8)
            
            HStack {
                Spacer().frame(width: 16)
                
                HStack(alignment: .center, spacing: 10) {
                    TextField(content, text: $text)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 12)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 16)
                .frame(height: 52, alignment: .leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(10)
                
                Spacer().frame(width: 16)
            }
        }
    }
}
