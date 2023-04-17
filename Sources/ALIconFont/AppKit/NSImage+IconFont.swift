//
//  NSImage+IconFont.swift
//  
//
//  Created by 张远文 on 2023/4/17.
//

#if canImport(AppKit)

import AppKit
import CoreGraphics

extension NSImage {
    
    convenience init(from fontName: String, code: String, textColor: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) {
        
        if
            let image = NSImage.Icon(from: fontName, code: code, textColor: textColor, backgroundColor: backgroundColor, size: size, fontPath: fontPath),
            let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)
        {
            self.init(cgImage: cgImage, size: size)
        } else {
            self.init()
        }
    }
    
    static func Icon(from fontName: String, code: String, textColor: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) -> NSImage? {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let fontSize = min(size.width / 1.28571429, size.height)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: Font.icon(from: fontName, ofSize: fontSize, fontPath: fontPath),
            .foregroundColor: textColor,
            .backgroundColor: backgroundColor,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedString = NSAttributedString(string:code, attributes: attributes)
        
        let stringSize = attributedString.size()
        let image = NSImage(size: stringSize)
        image.lockFocus()
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        image.unlockFocus()
    
        return image
    }
}

#endif
