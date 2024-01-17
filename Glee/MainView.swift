//
//  MainView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/17.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("Glee")
                    .font(
                    Font.custom("Poppins", size: 24)
                    .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.94, green: 0.4, blue: 0.27))

                }
            }
        }
    }
}


struct Main_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
