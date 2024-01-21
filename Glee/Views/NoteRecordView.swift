//
//  NoteRecordView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/19.
//

import SwiftUI

struct NoteRecordView: View {
    @State private var isSearchBarVisible = true
    @State var word : String = ""
    
    var body: some View {
        VStack {
            if isSearchBarVisible {
                SearchBar(isVisible : $isSearchBarVisible)
                    .transition(.slide)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    BackButton()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                ToolBarTail()
            }
        }
    }
}

struct NoteRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRecordView()
    }
}
