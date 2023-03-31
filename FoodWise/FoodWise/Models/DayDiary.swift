//
//  DayDiary.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import Foundation
import SwiftUI

enum MealType : Decodable {
    
  case breakfast
  case lunch
  case dinner
    case no
    
}

struct DayDiary  {
    
    
    var menu: String
    let imageURL: URL?
    var image: Image?
    var date : Date?
    var daytype : MealType?
   
    init(menu: String, imageURL: URL? = nil, image: Image? = nil,date:Date? = nil ,daytype: MealType? = nil) {
        self.menu = menu
        self.imageURL = imageURL
        self.image = image
        self.date = date
        self.daytype = daytype
    }
  
}

extension DayDiary: Decodable {
    
    enum CodingKeys: String, CodingKey{
        case menu
        case imageURL
        case daytype
        case date
        
    }
    
    
}
