//
//  SettingsView.swift
//  Hike
//
//  Created by Suneeshkumar K S on 21/06/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List{
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    VStack (spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }.foregroundStyle(
                    LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top,
                                   endPoint: .bottom)
                )
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("Learning a little each day adds up. Research shows that students who make learning a habit are more likely to reach their goals. Set time aside to learn and get reminders using your learning scheduler.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }//: Header View
            .listRowSeparator(.hidden)
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright @All right reserved")
                    Spacer()
                }
            ){
                //LabeledContent("Application", value: "Hike")

            }
        }
        
    }
}

#Preview {
    SettingsView()
}
