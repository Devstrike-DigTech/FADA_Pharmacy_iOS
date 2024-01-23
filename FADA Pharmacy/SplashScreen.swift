//
//  SplashScreen.swift
//  FADA Pharmacy
//
//  Created by Richard Uzor on 23/01/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var opacity = 0.5
    @State private var size = 0.8
    
    var body: some View {
        if isActive{
            ContentView()
        }else{
            ZStack{
                FADA_PRIMARY
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    VStack{
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 256, height: 256)
                            .clipShape(Circle())
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        isActive = true
                    }
                }
            }
        }
        
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
