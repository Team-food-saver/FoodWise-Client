//
//  DiaryRowView.swift
//  FoodWise
//
//  Created by dasoya on 31.03.23.
//

import SwiftUI

struct DiaryRowView: View {
    
    var diaryDict : [String: [DayDiary]] = [:]
    
    
    init?(currentDayDiaryList : [DayDiary]){
        
        guard currentDayDiaryList.count != 0 else {return nil}
        
        
        diaryDict["저녁"] = currentDayDiaryList.filter{ $0.daytype == MealType.dinner}
        diaryDict["점심"] = currentDayDiaryList.filter{ $0.daytype == MealType.lunch }
        diaryDict["아침"] = currentDayDiaryList.filter{ $0.daytype == MealType.breakfast }
    }
    
    var body: some View {
        
        var viewList = [AnyView]()
        let sortedKeys = ["아침","점심","저녁"]
        
        sortedKeys.forEach { key in
           
            var value = diaryDict[key]!
            
            guard value.count != 0 else {return }
            
            let view =  VStack(alignment: .leading){
                
                Text(key)
                    .subTitle1()
                   
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        
                        ForEach(0...value.count-1,id: \.self){ index in
                            
                            VStack(alignment: .leading,spacing: 0){
                                
                                
                                value[index].image?.resizable().aspectRatio(contentMode: .fill).frame(width: 166,height: 118).clipped()
                                
                                Text(value[index].menu)
                                    .subTitle3()
                                    .padding(.vertical,10)
                                    .padding(.leading,10)
                            }
                            .background(Color.mygray1)
                            .cornerRadius(4)
                            .shadow(color: .mygray2, radius: 2)
                            
                            
                        }}
                    
                }
            } .padding(.leading,20)
               
            
            viewList.append(AnyView(view))
        }
        
       
        
        return Group{
            ForEach(0...viewList.count-1,id: \.self){ index in
                
                viewList[index]
                
            }
        }
        
        
    }
    
//    func dictView() -> [AnyView] {
//
//
//
//        return viewList
//    }
}

struct DiaryRowView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryRowView(currentDayDiaryList: TestData.diaryList)
    }
}
