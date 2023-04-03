//
//  getMenuName.swift
//  FoodWise
//
//  Created by dasoya on 30.03.23.
//

import SwiftUI
 
enum defaultBool : Int {
    case mtrue = 1
    case mfalse = 0
    case mdefault = 2
}

struct getMenuName: View {
    
    @Binding var menuName : String 
    @Binding var selectedAsw: defaultBool //= defaultBool.mdefault
    let predictedName : String = "애호박전"// model prediction이 들어갈 자리
    
    
    var body: some View {
        
        menuName = predictedName
        
        return VStack(alignment: .leading){
            
            
            QuestionHeader(title: "'\(predictedName)'인가요?" , order: 3)
            
            
            Picker("메뉴이름 확인", selection: $selectedAsw) {
                Text("네").tag(defaultBool.mtrue)
                Text("아니오").tag(defaultBool.mfalse)
                
            }
            .frame(width:232,alignment: .leading)
           
            
            .pickerStyle(SegmentedPickerStyle())
            .onAppear(){
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.myprimary)
                UISegmentedControl.appearance().backgroundColor = UIColor(.mygray2)
            }
            
            
            
        }
    }
    
    
}

struct getNameFromUser: View {
    
    @Binding var menuName : String
    @Binding var isSubmitted : Bool
    
    var body: some View {
        
       menuName = ""
        
       return VStack(alignment: .leading){
            QuestionHeader(title: "이름을 알려주세요", order: 4)
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.mygray2)
                .frame(height: 49)
                .overlay(content: {
                    TextField("요리명을 입력하세요", text: self.$menuName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .multilineTextAlignment(.center)
                        //.frame(alignment: .center)
                        .frame(width: 150, height: 49)//width: 150,
                        .onSubmit {
                            isSubmitted = true
                        }
                })
            
            
        }
    }
}


    
//    struct getMenuName_Previews: PreviewProvider {
//        static var previews: some View {
//            getMenuName()
//        }
//    }
