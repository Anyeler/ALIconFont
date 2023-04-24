//
//  UILabel+IconFont.swift
//  ALIconFont
//
//  Created by 张远文 on 2023/4/24.
//

#if canImport(UIKit)

import UIKit

public extension UILabel {
    func parseIcon() {
        guard let code = self.text, let font  = self.font else { return }
        self.attributedText = code.icon(fontName: font.fontName, fontSize: font.pointSize)
    }
}

#endif
