//
//  CustomCircleView.swift
//  Hike
//
//  Created by Suneeshkumar K S on 30/05/2024.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimatedGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors:[.customIndigoMedium,
                                .customSalmonLight],
                        startPoint: isAnimatedGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimatedGradient ? .bottomLeading : .topTrailing
                    )
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimatedGradient.toggle()
                    }
                }
            MotionAnimationView()
        }// Zstack
        .frame(width: 256,height: 256)
        
    }
}

#Preview {
    CustomCircleView()
}
