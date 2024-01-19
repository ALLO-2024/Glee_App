//
//  NoteRecordView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/19.
//

import SwiftUI

struct NoteRecordView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Spacer().frame(width: 13)
                    
                    BackButton(action : {
                        presentationMode.wrappedValue.dismiss()
                    }, image: "BackButton")
                }
            }
        }
    }
}

struct NoteRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRecordView()
    }
}
