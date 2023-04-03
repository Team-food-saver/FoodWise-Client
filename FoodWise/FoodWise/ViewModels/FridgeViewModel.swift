//
//  FridgeViewModel.swift
//  FoodWise
//
//  Created by dasoya on 03.04.23.
//

import Foundation


class FridgeViewModel : ObservableObject {
    
    @Published var FridgeList = ["육류" : TestData.ingredients,"해산물": TestData.ingredients1, "과일": TestData.ingredients2,"유제품": TestData.ingredients3,"채소": TestData.ingredients4,"기타": TestData.ingredients5]
    
    init(){
        
    }
    
    func appendList(item: Ingredient) {
        self.FridgeList["육류"]?.append(item)
    }
}
