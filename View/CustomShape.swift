//
//  CustomShape.swift
//  UI-271
//
//  Created by nyannyan0328 on 2021/07/27.
//

import SwiftUI

struct CustomShape: Shape {
    
    var radi : CGFloat
    var corner : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
   
}


