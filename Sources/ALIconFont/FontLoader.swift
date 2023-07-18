//
//  FontLoader.swift
//  ALIconFont
//
//  Created by 张远文 on 2023/4/13.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

import Foundation
import CoreText

public struct FontLoader {
    
    public static func loadFont(_ fontName: String, bundle: Bundle = .main) throws {
        guard let fileUrl = bundle.url(forResource: fontName, withExtension: "ttf") else {
            throw NSError(domain: "[ALIconFont]: 没有找到 \(fontName).ttf 文件", code: 10001)
        }
        try self.loadFont(from: fileUrl)
    }
    
    public static func loadFont(from fontPath: URL) throws {
        var error: Unmanaged<CFError>?
        guard
            !CTFontManagerRegisterFontsForURL(fontPath as NSURL, .process, &error),
            let unwrappedError = error,
            let nsError = (unwrappedError.takeUnretainedValue() as AnyObject) as? NSError else {

            return
        }
        throw nsError
    }
}

public extension Font {
    #if os(iOS) || os(tvOS)
    static func icon(from fontName: String, ofSize size: CGFloat, fontPath: URL? = nil) -> Font? {
        let fontNames = Font.fontNames(forFamilyName: fontName)
        if fontNames.contains(fontName) {
            return Font(name: fontName, size: size)
        }
        guard let fontUrl = fontPath else {
            try? FontLoader.loadFont(fontName)
            return Font(name: fontName, size: size)
        }
        try? FontLoader.loadFont(from: fontUrl)
        return Font(name: fontName, size: size)
    }
    #elseif os(OSX)
    static func icon(from fontName: String, ofSize size: CGFloat, fontPath: URL? = nil) -> Font? {
        if let fontUrl = fontPath {
            try? FontLoader.loadFont(from: fontUrl)
        } else {
            try? FontLoader.loadFont(fontName)
        }
        return Font(name: fontName, size: size)
    }
    #endif
}
