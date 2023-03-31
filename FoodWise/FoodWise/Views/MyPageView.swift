//
//  MyPageView.swift
//  FoodWise
//
//  Created by dasoya on 19.02.23.
//

import Foundation
import SwiftUI
import GoogleSignIn


struct MyPageView : View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    private var user: GIDGoogleUser? {
      return GIDSignIn.sharedInstance.currentUser
    }
    
    var body: some View {
        
        VStack{
            
            Text("마이 페이지")
                .title3()
            
            if let userProfile = user?.profile{
                
                HStack(alignment: .top) {
//                  UserProfileImageView(userProfile: userProfile)
//                    .padding(.leading)
                  VStack(alignment: .leading) {
                    Text(userProfile.name)
                      .font(.headline)
                    Text(userProfile.email)
                  }

                Spacer()
                Button(NSLocalizedString("로그아웃", comment: "Sign out button"), action: signOut)
            
                }.padding()
            }
                //Spacer()
            }
        
    }
    
    func signOut() {
      authViewModel.signOut()
    }
}
