//
//  CreateDiaryView.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import SwiftUI

struct CreateDiaryView: View {
    
    @State var newDiary : DayDiary = DayDiary(menu: "")
    @State var mealType : MealType = MealType.no
    @State var menuImg : UIImage?
    @State var menuName : String = ""
    @State var menuPrediction : defaultBool = defaultBool.mdefault
    @State var isSubmitted : Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    @StateObject var weekStore = WeekStore()
    @StateObject var diaryViewModel = DairyViewModel()
    var body: some View {
        NavigationView(){
            
            ScrollView(showsIndicators: false){
                
                VStack(){
                    
                    if menuPrediction == defaultBool.mtrue ||  isSubmitted {
                        
                        deleteIngredientsView()
                         
                       
                    }
                    
                    if menuPrediction == defaultBool.mfalse {
                        getNameFromUser(menuName: $menuName,isSubmitted: $isSubmitted)
                    }
                    
                    if menuImg != nil {
                        HStack{
                            getMenuName(menuName: $menuName, selectedAsw: $menuPrediction)
                                .padding(.bottom,32)
                                .padding(.leading,25)
                            Spacer()
                        }
                        
                    }
                    
                    if mealType != MealType.no {
                        
                        getMenuPicture(selectedImage: $menuImg)
                        
                    }
                    
                    DayTypeView(selectedMeal: $mealType)
                }
            }
        }.toolbar{
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    newDiary.date = weekStore.currentDate
                    newDiary.daytype = mealType
                    newDiary.image = Image(uiImage: menuImg!)
                    diaryViewModel.diaryList.append(newDiary)
                } label: {
                    Text("완료").foregroundColor( menuPrediction == defaultBool.mtrue ||  isSubmitted  ? Color.myprimary : .white)
                       .disabled(!( menuPrediction == defaultBool.mtrue ||  isSubmitted ))
                }

                    
                }
        }.navigationTitle(Text("식단 추가"))
           
        
    }
}

struct QuestionHeader : View {
    
    let title : String
    let order : Int
    
    var body: some View {
        HStack{
            
            Circle()
                .foregroundColor(.myprimary)
                .frame(width: 20,height:20)
                .overlay(Text(order.description).subTitle2())
            
            Text(title)
                .title2()
            
            
        }.padding(.bottom,16)
    }
}

struct CreateDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        CreateDiaryView()
    }
}
