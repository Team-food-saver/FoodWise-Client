//
//  DiaryView.swift
//  FoodWise
//
//  Created by dasoya on 19.03.23.
//

import SwiftUI

struct DiaryView: View {
    
    @ObservedObject var vm = DairyViewModel()
    @ObservedObject var weekStore = WeekStore()

    
    
    var body: some View {
        let calendar = Calendar.current
       
        return NavigationView{
            
            
            VStack(){
                WeeklyHeader(vm:vm, weekStore: weekStore)
                    .padding(.top,38)
                    .padding(.bottom,24)
                    .frame(height: UIScreen.main.bounds.height*0.2)
                   // .background(.black)
                    
                if vm.diaryList.count == 0 {
                    Spacer()
                    HStack{
                        
                        Text("식단 일지를 추가하세요!")
                            .subTitle1()
                            .frame(alignment: .center)
                            .padding(.horizontal)
                          //  .padding(.leading,125)
                    }
                    Spacer()
                }
                
                
                ZStack(alignment: .bottomTrailing){
                    
                  
                    ScrollView(showsIndicators: false){
                        VStack{
                            DiaryRowView(currentDayDiaryList:vm.diaryList.filter{calendar.isDate($0.date! , equalTo:  weekStore.currentDate, toGranularity: .day)})
                            Spacer(minLength: 100)
                        }//.padding(20)
                            
                    }
                            
                    NavigationLink(destination: CreateDiaryView(vm:vm)){
                        
                        HStack{
                            
                            Spacer()
                        Circle()
                            .frame(width: 56,height: 56)
                            .foregroundColor(.myprimary)
                            .overlay(Image(systemName: "plus")
                                .font(.system(size: 29, weight: .semibold))
                                .foregroundColor(.black),alignment: .center)
                            .padding(.bottom,45)
                        .padding(.trailing,20)}
                    }
                   
                }
                
            }
        }
        
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
