//
//  String+IconFont.swift
//  ALIconFont
//
//  Created by 张远文 on 2023/4/24.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public extension String {
    
    func icon(fontName: String, color: Color = .black, backgroundColor: Color = .clear, fontSize: CGFloat, fontPath: URL? = nil) -> NSMutableAttributedString? {
        
        guard let font = Font.icon(from: fontName, ofSize: fontSize, fontPath: fontPath) else { return nil }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color,
            .backgroundColor: backgroundColor,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedString = NSMutableAttributedString(string: self, attributes: attributes)
        return attributedString
    }
    
}
