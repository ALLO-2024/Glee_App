//
//  HomeSearchView.swift
//  Glee
//
//  Created by 최재혁 on 2024/02/01.
//

import SwiftUI

struct HomeSearchView: View {
    var body: some View {
        VStack {
            
        }
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
