//
//  View+Ext.swift
//  TanTan
//
//  Created by hmf on 2024/7/8.
//

import SwiftUI

extension View {
    
//    func `if`(_ condition:Bool , transform:(Self) -> Transform) -> some View {
//        if condition {
//            transform(self)
//        } else {
//            self
//        }
//    }
    
    
    func colorButton(type:ButtonType) -> some View {
        self.modifier(ColorButton(type: type))
    }
    
}
