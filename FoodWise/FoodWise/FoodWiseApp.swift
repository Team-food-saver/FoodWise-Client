//
//  FoodWiseApp.swift
//  FoodWise
//
//  Created by dasoya on 17.02.23.
//

import SwiftUI
import GoogleSignIn

@main
struct FoodWiseApp: App {
    
    @StateObject var authViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .onAppear {
                  GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                    if let user = user {
                      self.authViewModel.state = .signedIn(user)
                    } else if let error = error {
                      self.authViewModel.state = .signedOut
                      print("There was an error restoring the previous sign-in: \(error)")
                    } else {
                      self.authViewModel.state = .signedOut
                    }
                  }
                }
                .onOpenURL { url in
                          GIDSignIn.sharedInstance.handle(url)
                        }
                
        }
    }
}

struct TestData {
    
    static var recipe = Recipe(id: 0,name:"투움바 파스타", imageURL: URL(fileURLWithPath: "none"),likeCnt: 32, ingredientList: ingredients,recipeList: recipeList1, ingredient:"감자", expiredDate: 2)
    static let hotrecipe = [recipe]
    static let recipeList1 : [RecipeHow] = [RecipeHow(id: 1, content: "면을 삶아줍니다."), RecipeHow(id: 2, content: "22")]
    static var ingredient = Ingredient(id:  1, name:"돼지고기",amount: 800, expiredDate: Date())
    
    static var ingredientsSearch : [Ingredient] =  [TestData.ingredient,
                                              Ingredient(id: 2, name:"양고기",amount: 300, expiredDate: Date()),
                                                    Ingredient(id: 2, name:"소고기",amount: 300, expiredDate: Date())
                                              ]
    static var ingredients : [Ingredient] =  [TestData.ingredient,
                                              Ingredient(id: 2, name:"양고기",amount: 300, expiredDate: Date()),
                                              ]
    
    static var ingredients1 : [Ingredient] =  [Ingredient(id: 3, name:"새우",amount: 800, expiredDate: Date())
                                              ]
    static var ingredients2 : [Ingredient] =  [Ingredient(id: 4, name:"파인애플",amount: 800, expiredDate: Date())
                                              ]
    static var ingredients3 : [Ingredient] =  [Ingredient(id: 5, name:"우유",amount: 800, expiredDate: Date())
                                              ]
    static var ingredients4 : [Ingredient] =  [Ingredient(id: 6, name:"양파",amount: 800, expiredDate: Date())
                                              ]
    static var ingredients5 : [Ingredient] =  [Ingredient(id: 7, name:"설탕",amount: 800, expiredDate: Date())
                                              ]
    
    
    static var diary = DayDiary(menu: "투움바 파스타",image: Image("sample"),date: Date(),daytype: MealType.breakfast)
    static var diaryList = [diary,
                            DayDiary(menu: "투움바 파스타",image: Image("sample"),date: Date(),daytype: MealType.lunch),
                            DayDiary(menu: "투움바 파스타",image: Image("sample"),date: Date(),daytype: MealType.dinner),
                            DayDiary(menu: "된장찌개",image: Image("sample1"),date: Date(),daytype: MealType.breakfast)]
    
    
//    static var Recipes : [Recipe] = {
//        let url = Bundle.main.url(forResource: "/app/recipe/recommend", withExtension: "json")
//        let data = try! Data(contentsOf: url)
//        let wrapper = try! JSONDecoder().decode(Wrapper<Recipe>.self, from: data)
//       
//        return wrapper.items
//    }()
    
}
