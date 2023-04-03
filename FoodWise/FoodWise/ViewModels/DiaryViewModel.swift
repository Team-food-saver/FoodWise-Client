//
//  DiaryViewModel.swift
//  FoodWise
//
//  Created by dasoya on 31.03.23.
//

import Foundation

class DairyViewModel : ObservableObject {
    
    @Published var diaryList : [DayDiary] = []
    
    init(){
        self.diaryList += TestData.diaryList
    }
    
    func appendList(item: DayDiary) {
        self.diaryList.append(item)
    }
}
