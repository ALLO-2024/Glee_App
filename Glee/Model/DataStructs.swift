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
    let action:() -> Void
    var image : String
    
    var body : some View {
        Button (action : action) {
            Image(image)
                .frame(width: 24, height: 24)
        }
    }
}
