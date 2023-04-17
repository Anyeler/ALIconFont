//
//  File.swift
//  ALIconFont
//
//  Created by 张远文 on 2023/4/13.
//

#if os(iOS) || os(tvOS)
import UIKit
public typealias Font = UIFont
public typealias Color = UIColor
#elseif os(OSX)
import AppKit
public typealias Font = NSFont
public typealias Color = NSColor
#endif
