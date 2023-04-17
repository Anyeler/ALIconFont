//
//  File.swift
//  
//
//  Created by 张远文 on 2023/4/13.
//

#if canImport(UIKit)

import UIKit

public extension UIImage {
    
    convenience init(from fontName: String, code: String, textColor: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let fontSize = min(size.width / 1.28571429, size.height)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: Font.icon(from: fontName, ofSize: fontSize, fontPath: fontPath),
            .foregroundColor: textColor,
            .backgroundColor: backgroundColor,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedString = NSAttributedString(string: code, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: image.imageOrientation)
        } else {
            self.init()
        }
    }

    static func icon(from fontName: String, iconColor: Color, code: String, imageSize: CGSize, ofSize size: CGFloat, fontPath: URL? = nil) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        
        code.draw(in: CGRect(x:0, y:0, width:imageSize.width, height:imageSize.height), withAttributes: [.font: Font.icon(from: fontName, ofSize: size, fontPath: fontPath), .paragraphStyle: paragraphStyle, .foregroundColor: iconColor])
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

#endif
