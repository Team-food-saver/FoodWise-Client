//
//  DiaryViewModel.swift
//  FoodWise
//
//  Created by dasoya on 31.03.23.
//

import Foundation

class DairyViewModel : ObservableObject {
    
    @Published var diaryList : [DayDiary] = TestData.diaryList
    
    init(){
       
    }
}
