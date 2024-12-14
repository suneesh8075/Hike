//
//  CardView.swift
//  Hike
//
//  Created by Suneeshkumar K S on 23/05/2024.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    @State private var imageNmber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    // MARK: - Functions
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNmber
        
        imageNmber = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                VStack(alignment: .leading) {
                    // MARK: - Header
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                        )
                        Spacer()
                        Button(action: {
                            print("btn pressed")
                            isShowingSheet.toggle()
                        }, label: {
                            CustomButtonView()
                        }).sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                        )
                    }
                    Text("Fun and enjoyable outdoor activity for friends and family.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                ZStack {
                                    
                    CustomCircleView()
                    
                    Image("image-\(imageNmber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNmber)
                }
                // MARK: - Footer
                Button {
                    print("clikked")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .customGreenLight,
                                .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(
                            color: .black.opacity(0.25),
                            radius:  0.25, x:1 , y: 2
                        )
                }
                .buttonStyle(GradientButton())
        
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
