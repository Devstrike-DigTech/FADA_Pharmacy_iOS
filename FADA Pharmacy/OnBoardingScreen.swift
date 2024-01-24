//
//  OnBoardingScreen.swift
//  FADA Pharmacy
//
//  Created by Richard Uzor on 24/01/2024.
//

import SwiftUI

private let onBoardingSteps = [
    OnBoardingStep(image: "Pharm1", title: "Boost Your Pharmacy Audience", description: "Expand your pharmacy's reach with FADA. Our innovative marketing and engagement tools connect you with a wider audience, building lasting client relationships and fostering trust in your community."),OnBoardingStep(image: "Pharm2", title: "Organize Your Pharmacy Inventory", description: "FADA helps streamline your pharmacy's inventory management effortlessly. Say goodbye to stockouts and overstocking, ensuring your shelves are always well-stocked and ready to serve your customers."),OnBoardingStep(image: "Pharm3", title: "Skyrocket Your Pharmacy Net Profit", description: "Unlock hidden revenue potential with FADA. Our  software analyses sales data to identify growth opportunities, helping your pharmacy optimize pricing, promotions, and product offerings for increased profitability."),
]
struct OnBoardingScreen: View {
    
    @AppStorage("currentPage") private var currentStep = 0
    @StateObject private var dataStore = DataStore()
    @State private var navigateToHome = false
    
    
    init(){
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        dataStore.isFirstTime.toggle()
                    }){
                        Text("Skip")
                            .padding(16)
                            .foregroundColor(.gray)
                    }
                }
                TabView(selection: $currentStep){
                    ForEach(0..<onBoardingSteps.count){it in
                        VStack{
                            Image(onBoardingSteps[it].image)
                                .resizable()
                                .frame(width: 250, height: 250)
                            
                            Text(onBoardingSteps[it].title)
                                .font(.title)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 32)
                                .padding(.bottom)
                                .kerning(1.4)
                            
                            Text(onBoardingSteps[it].description)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 32)
                                .kerning(1.3)
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack{
                    ForEach(0..<onBoardingSteps.count){ it in
                        if it == currentStep{
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(FADA_PRIMARY)
                        }else{
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.bottom, 24)
                }
                
//                NavigationLink(destination: ContentView(), isActive: $navigateToHome) {
//
                    Button(action: {
                        if self.currentStep < onBoardingSteps.count - 1
                        {
                            self.currentStep += 1
                        } else{
                            //GET STARTED LOGIC...NAV TO LOGIN
                            dataStore.isFirstTime.toggle()
                            self.navigateToHome = true
//                            UserDefaults.standard.set(false, forKey: IS_FIRST_TIME)

                        }
                        
                    }){
                        
                        Text(currentStep < onBoardingSteps.count - 1 ? "Next" : "Get Started")
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(FADA_PRIMARY)
                            .cornerRadius(16)
                            .padding(.horizontal, 16)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                //}
            }
        }
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
