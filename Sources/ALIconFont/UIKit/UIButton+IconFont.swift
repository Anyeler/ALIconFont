//
//  UIButton+IconFont.swift
//  ALIconFont
//
//  Created by 张远文 on 2023/4/24.
//

#if canImport(UIKit)

import UIKit

public extension UIButton {
    
    func parseIcon() {
        guard let currentTitle = self.titleLabel?.text, let font = self.titleLabel?.font else { return }
        let attrTitle = currentTitle.icon(fontName: font.fontName, color: self.currentTitleColor, fontSize: font.pointSize)
        self.setAttributedTitle(attrTitle, for: UIControl.State())
    }
}

#endif
