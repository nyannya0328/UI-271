//
//  OffsetModefiers.swift
//  UI-271
//
//  Created by nyannyan0328 on 2021/07/27.
//

import SwiftUI

struct OffsetModefiers: ViewModifier {
    @Binding var offset : CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
            
                GeometryReader{proxy -> Color in
                
                let minY = proxy.frame(in: .named("SCROLL")).minY
                
                DispatchQueue.main.async {
                    
                    
                    self.offset = minY
                }
                
                
                return Color.clear
            }
                
                ,alignment: .bottom
            
            )
        
    }
}

