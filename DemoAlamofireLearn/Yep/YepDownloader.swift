//
//  YepDownloader.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/8.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation


final class YepDownloader: NSObject {
    
    typealias Realm = NSObject
    
    static let shareDownloader = YepDownloader()
    
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        return session
    }()
    
    
}

extension YepDownloader: URLSessionDelegate {}

extension YepDownloader: URLSessionDataDelegate {
    
}
