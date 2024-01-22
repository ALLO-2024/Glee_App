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
    @State private var progress = 0.0
    @State private var nowTime : String = "06:24"
    @State private var totalTime : String = "34:17"
    @State var frameSize : CGFloat = 24.0
    @State var word : String = ""
    @State var category : String = "전공"
    @State var name : String = "미디어 비지니스론 13주차 2차시 수업"
    @State var time : String = "2024.11.25 오후 3:34 • 34분 17초"
    @State var topics : [String] = ["미디어 기업", "비지니스 모델", "경제관리", "가치 네트워크", "TMAC"]
    @State var noteKR : String = "오늘의 수업 목표는 다음과 같습니다. 미디어 산업의 주요 개념과 흐름을 이해합니다. 디지털 시대의 미디어 비즈니스 모델을 분석하고 평가합니다. 미래에 대비한 지속 가능한 비즈니스 전략을 탐구합니다. 먼저 미디어 산업의 개요에 대해 알아보겠습니다. 미디어 산업은 정보나 엔터테인먼트를 전달하거나 소비자에게 제공하기 위해 사용되는 매체와 기술의 집합입니다. 이 산업은 텔레비전, 라디오, 신문, 온라인 플랫폼, 소셜 미디어 등과 같은 다양한 형태로 나타납니다. 주요한 요소로는 콘텐츠 생산과 유통, 소비자들의 수용과 이용, 그리고 광고와 수익 창출이 있습니다. 콘텐츠 생산은 정보, 뉴스, 엔터테인먼트, 광고 등을 만들어내는 과정을 포함합니다. 유통은 이러한 콘텐츠를 다양한 플랫폼을 통해 전달하고 소비자들에게 접근하는 방법을 다룹니다. 먼저 미디어 산업의 개요에 대해 알아보겠습니다. 미디어 산업은 정보나 엔터테인먼트를 전달하거나 소비자에게 제공하기 위해 사용되는 매체와 기술의 집합입니다. 이 산업은 텔레비전, 라디오, 신문, 온라인 플랫폼, 소셜 미디어 등과 같은 다양한 형태로 나타납니다. 주요한 요소로는 콘텐츠 생산과 유통, 소비자들의 수용과 이용, 그리고 광고와 수익 창출이 있습니다. 콘텐츠 생산은 정보, 뉴스, 엔터테인먼트, 광고 등을 만들어내는 과정을 포함합니다. 유통은 이러한 콘텐츠를 다양한 플랫폼을 통해 전달하고 소비자들에게 접근하는 방법을 다룹니다. 소비자들의 수용과 이용은 미디어를 소비하는 방식과 그에 따른 행동을 의미합니다. 이는 어떤 콘텐츠를 선택하고, 어떤 플랫폼을 선호하는지 등을 포함합니다. 마지막으로 광고와 수익 창출은 광고주들이 미디어를 통해 광고를 전달하고, 이를 통해 수익을 창출하는 비즈니스적 측면을 다룹니다."
    @State var noteOther : String = "Xin chào, chào mừng các bạn đến với buổi học về Động lực và Triển vọng của Ngành Truyền thông, Quảng cáo. Trong buổi học ngày hôm nay, chúng ta sẽ thảo luận về các xu hướng chính của ngành công nghiệp truyền thông hiện đại và các chiến lược kinh doanh. Mục tiêu của buổi học hôm nay là như sau: Hiểu rõ về các khái niệm và quy luật chính trong ngành công nghiệp truyền thông. Phân tích và đánh giá Mô hình Kinh doanh Truyền thông trong thời đại số. Nghiên cứu các chiến lược kinh doanh bền vững để chuẩn bị cho tương lai. Đầu tiên, chúng ta sẽ tìm hiểu về tổng quan về ngành công nghiệp truyền thông. Ngành công nghiệp này bao gồm các phương tiện và công nghệ được sử dụng để truyền tải thông tin hoặc giải trí đến người tiêu dùng. Các hình thức trong ngành này có thể là truyền hình, radio, báo chí, nền tảng trực tuyến, và mạng xã hội, v.v. Các yếu tố chính bao gồm sự sản xuất và phân phối nội dung, sự chấp nhận và sử dụng của người tiêu dùng, cũng như quảng cáo và tạo lợi nhuận. Sản xuất nội dung liên quan đến quá trình tạo ra thông tin, tin tức, giải trí, quảng cáo, v.v. Phân phối là cách thức truyền tải nội dung này thông qua các nền tảng khác nhau đến người tiêu dùng và cách tiếp cận họ. Sự chấp nhận và sử dụng của người tiêu dùng là về cách họ tiêu thụ các phương tiện truyền thông và hành vi kết quả từ đó. Cuối cùng, quảng cáo và tạo lợi nhuận đề cập đến khía cạnh kinh doanh của việc quảng cáo thông qua phương tiện truyền thông và tạo doanh thu từ đó."
    
    var body: some View {
        VStack {
            if isSearchBarVisible {
               Spacer().frame(height: frameSize/2)
               SearchBar()
               Spacer().frame(height: frameSize/2)
           }
           else {
               Spacer().frame(height: frameSize)
           }
            
            //MARK: name
            VStack(alignment: .leading, spacing: 8) {
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
            .padding(EdgeInsets(top: 0, leading: 19, bottom: 0, trailing: 19))
            
            Spacer().frame(height: 66)
            
            //MARK: 기록, 요약
            Group {
                HStack(spacing: 0) {
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
                
                ScrollView {
                    VStack {
                        Language(language: "한국어 기록")
                        
                        Text(noteKR)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                            .frame(width: 358, alignment: .topLeading)
                        
                        Language(language: "베트남어 기록")
                        
                        Text(noteOther)
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                            .frame(width: 358, alignment: .topLeading)
                    }
                }
                
                Spacer().frame(height: 16)
                
                ProgressView(value: progress)
                    .frame(width: UIScreen.main.bounds.width)
                
                HStack {
                    Spacer().frame(width: 8)
                    
                    Text(nowTime)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 10)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.94, green: 0.4, blue: 0.27))
                    
                    Spacer()
                    
                    Text(totalTime)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 10)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Spacer().frame(width: 8)
                }
                
                Spacer().frame(height: 1)
                
                Image("play")
                    .frame(width: 30, height: 30)
            }
            .padding(EdgeInsets(top: 0, leading: 19, bottom: 0, trailing: 19))
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
