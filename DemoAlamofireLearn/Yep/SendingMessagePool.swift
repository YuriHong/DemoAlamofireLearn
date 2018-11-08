//
//  SendingMessagePool.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/8.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation

/// 消息发送池
final public class SendingMessagePool {
//    private var tempMessageIds = [String]()
    private var tempMessageIds = Set<String>()
    static let share = SendingMessagePool()
    
    private init () {}
    
    static func containsMessage(_ id: String) -> Bool {
        return SendingMessagePool.share.tempMessageIds.contains(id)
    }
    
    static func addMessage(_ id: String) {
        SendingMessagePool.share.tempMessageIds.insert(id)
    }
    
    static func removeMessage(_ id: String) {
        SendingMessagePool.share.tempMessageIds.remove(id)
    }
}

