//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Suneeshkumar K S on 30/05/2024.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    // MARK: - Functions
    // RANDOM COORDINATE
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    // RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    //
    var body: some View {
        ZStack{
            ForEach(0...randomCircle,id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(),
                              y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        }//: Zstack
        .frame(width: 256,height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
}
