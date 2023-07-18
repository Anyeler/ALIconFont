//
//  File.swift
//  
//
//  Created by 张远文 on 2023/4/13.
//

#if canImport(UIKit)

import UIKit

public extension UIImage {
    
    convenience init?(fontName: String, code: String, color: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) {
        
        let fontSize = min(size.width / 1.28571429, size.height)
        
        guard let attributedString = code.icon(fontName: fontName, color: color, backgroundColor: backgroundColor, fontSize: fontSize, fontPath: fontPath) else {
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: image.imageOrientation)
        }
        return nil
    }
    
    static func icon(fontName: String, code: String, color: Color = .black, backgroundColor: Color = .clear, size: CGSize, fontPath: URL? = nil) -> UIImage? {
        return UIImage(fontName: fontName, code: code, color: color, backgroundColor: backgroundColor, size: size, fontPath: fontPath)
    }
}

#endif
