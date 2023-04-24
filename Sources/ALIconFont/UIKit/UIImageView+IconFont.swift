//
//  UIImageView+IconFont.swift
//  ALIconFont
//
//  Created by 张远文 on 2023/4/24.
//

#if canImport(UIKit)

import UIKit

public extension UIImageView {
    
    func setIcon(fontName: String, code: String, color: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) {
        self.image = UIImage(fontName: fontName, code: code, color: color, backgroundColor: backgroundColor, size: size, fontPath: fontPath)
    }
}

#endif
