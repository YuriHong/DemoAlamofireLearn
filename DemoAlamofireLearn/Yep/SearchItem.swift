//
//  SearchItem.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/8.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation
import CoreSpotlight


fileprivate let SeparaterStr = "/"

protocol Searchable {
    var item: SearchItem { set get }
    var itemID: String { set get }
}

extension Searchable {
    
    var searchID: String {
        return item.rawValue + SeparaterStr + itemID
    }
    
    func delete() -> Void {
        item.delete(items: [itemID])
    }
    
    func delete(ids: [String]) -> Void {
        item.delete(items: ids)
    }
}

/// 可搜索的栏目
///
/// - user: 用户
/// - feed: feed
enum SearchItem: String {
    case user
    case feed
    
    func item(_ searchID: String) -> String {
        let parts = searchID.components(separatedBy: SeparaterStr)
        guard parts.count == 2 else { return "" }
        return parts[1]
    }
    
    func delete(items ids: [String]) -> Void {
        let searchItems = ids.map { (id) -> String in
            return self.rawValue + SeparaterStr + id
        }
        CSSearchableIndex.default()
            .deleteSearchableItems(withIdentifiers: searchItems) { (err) in
            
        }
    }
}





