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
    
    convenience init(fontName: String, code: String, color: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) {
        
        if
            let image = NSImage.icon(fontName: fontName, code: code, color: color, backgroundColor: backgroundColor, size: size, fontPath: fontPath),
            let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)
        {
            self.init(cgImage: cgImage, size: size)
        } else {
            self.init()
        }
    }
    
    static func icon(fontName: String, code: String, color: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) -> NSImage? {

        let fontSize = min(size.width / 1.28571429, size.height)
        
        let attributedString = code.icon(fontName: fontName, color: color, backgroundColor: backgroundColor, fontSize: fontSize, fontPath: fontPath)
        
        let stringSize = attributedString.size()
        let image = NSImage(size: stringSize)
        image.lockFocus()
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        image.unlockFocus()
    
        return image
    }
}

#endif
