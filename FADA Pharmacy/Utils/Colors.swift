//
//  Colors.swift
//  FADA Pharmacy
//
//  Created by Richard Uzor on 23/01/2024.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0
        )
    }
}

public var FADA_PRIMARY_HEX = 0x3C9386
public var FADA_PRIMARY = Color(hex: FADA_PRIMARY_HEX)
