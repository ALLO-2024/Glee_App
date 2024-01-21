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
    @State private var isSearchBarVisible = false
    
    var body : some View {
        HStack {
            Button(action: {
                    isSearchBarVisible.toggle()
                    if isSearchBarVisible {
                        print("isSearchvisble")
                    } else {
                        print("unvisible")
                    }
            }, label: {
                Image("Modify")
                    .frame(width: 24, height: 24)
            })
            Spacer().frame(width: 12)
            
            Button(action: {
                
            }, label: {
                Image("Download")
                    .frame(width: 24, height: 24)
            })
        }
    }
}

//MARK: Search
struct SearchBar : View {
    @Binding var isVisible: Bool
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
