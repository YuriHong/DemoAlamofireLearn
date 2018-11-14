//
//  FileManagerComponent.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/12.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation


struct YYFileManager {
    static let `default` = FileManager.default
    
    // MARK: - 沙盒目录相关
    /// 主目录
    ///
    /// - Returns: 主目录路径
    public static func homeDir() -> String {
        return NSHomeDirectory()
    }
    
    /// Documents 路径
    ///
    /// - Returns: Documents 路径
    public static func documentsDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
    
    /// Library路径
    ///
    /// - Returns: Library路径
    public static func libraryDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
    }
    
    /// Preferences目录
    ///
    /// - Returns: Preferences 路径
    public static func preferencesDir() -> String {
        return YYFileManager.libraryDir().appending("/Preferences")
    }
    
    /// cache 目录
    ///
    /// - Returns: cache路径
    public static func cachesDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
    }
    
    /// 临时目录
    ///
    /// - Returns: tmp路径
    public static func tmpDir() -> String {
        return NSTemporaryDirectory()
    }
    
}
