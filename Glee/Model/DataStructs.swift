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

struct ToolBarTail : View {
    var body : some View {
        HStack {
            Button(action: {
                
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
