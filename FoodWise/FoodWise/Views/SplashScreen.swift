////
////  SplashScreen.swift
////  FoodWise
////
////  Created by dasoya on 31.03.23.
////
//
//import SwiftUI
//
//struct SplashView: View {
//
//    @State var isActive: Bool = false
//
//    var body: some View {
//        ZStack {
//            if self.isActive {
//                ContentView()
//            } else {
//                Rectangle()
//                    .background(Color.myprimary)
//                Image("foodWiseImg")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
//            }
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//                withAnimation {
//                    self.isActive = true
//                }
//            }
//        }
//    }
//
//}
//
//struct SplashView_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashView()
//    }
//}
