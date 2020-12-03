//
//  TabBarShape.swift
//  InstagramRedesignConcept
//
//  Created by Raphael Cerqueira on 02/12/20.
//

import SwiftUI

struct TabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let widthFactor = rect.maxX / 6
        let widthFactorTimesCount = widthFactor * 3
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        path.addLine(to: CGPoint(x: widthFactorTimesCount + (1.5 * widthFactor), y: rect.midY))
        
        path.addCurve(to: CGPoint(x: widthFactorTimesCount, y: rect.minY + 50),
                      control1: CGPoint(x: widthFactorTimesCount + 40, y: rect.midY),
                      control2: CGPoint(x: widthFactorTimesCount + 40, y: rect.minY + 50))
        
        path.addCurve(to: CGPoint(x: widthFactorTimesCount - (1.5 * widthFactor), y: rect.midY),
                      control1: CGPoint(x: widthFactorTimesCount - 40, y: rect.minY + 50),
                      control2: CGPoint(x: widthFactorTimesCount - 40, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.maxX - widthFactorTimesCount, y: rect.midY))
        
        return path
    }
}

struct TabBarShape_Previews: PreviewProvider {
    static var previews: some View {
        TabBarShape()
            .frame(height: 200)
    }
}
