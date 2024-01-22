//
//  NoteRecordView.swift
//  Glee
//
//  Created by 최재혁 on 2024/01/19.
//

import SwiftUI

struct NoteRecordView: View {
    @State private var isSearchBarVisible = false
    @State private var isRecord = true
    @State private var isSummery = false
    @State var frameSize : CGFloat = 24.0
    @State var word : String = ""
    @State var category : String = "전공"
    @State var name : String = "미디어 비지니스론 13주차 2차시 수업"
    @State var time : String = "2024.11.25 오후 3:34 • 34분 17초"
    @State var topics : [String] = ["미디어 기업", "비지니스 모델", "경제관리", "가치 네트워크", "TMAC"]
    @State var note : String = ""
    
    var body: some View {
        VStack {
            if isSearchBarVisible {
                Spacer().frame(width: frameSize/2)
                SearchBar()
                Spacer().frame(width: frameSize/2)
            }
            else {
                Spacer().frame(width: frameSize)
            }
            
            //MARK: name
            VStack {
                HStack{
                    Spacer().frame(width: 19)
                    
                    VStack (alignment: .leading, spacing: 8){
                        Text(category)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 10)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color(red: 0.94, green: 0.4, blue: 0.27))
                        
                        Text(name)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                        
                        Text(time)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 12)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        
                        HStack {
                            ForEach(0..<topics.count) { topic in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(topics[topic])
                                        .font(
                                            Font.custom("Apple SD Gothic Neo", size: 10)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.29, green: 0.29, blue: 0.29))
                                    
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 6)
                                .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                                .cornerRadius(10)
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            
            Spacer().frame(height: 66)
            
            //MARK: 기록, 요약
            HStack(spacing : 0) {
                simpleText(categoty: "기록", size: UIScreen.main.bounds.width/2, isChoice: $isRecord)
                    .onTapGesture {
                        isSummery.toggle()
                        isRecord.toggle()
                    }
                
                simpleText(categoty: "요약", size: UIScreen.main.bounds.width/2, isChoice: $isSummery)
                    .onTapGesture {
                        isSummery.toggle()
                        isRecord.toggle()
                    }
            }
            
            Spacer().frame(height: 16)
            
            
            Spacer().frame(height: 16)
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    BackButton()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ToolBarTail(isSearchBarVisible: $isSearchBarVisible)
            }
        }
    }
}

struct NoteRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRecordView()
    }
}
