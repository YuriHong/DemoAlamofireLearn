//
//  InterfaceSegregationPrinciple.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/8.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation

//原则四：接口分离原则（Interface Segregation Principle）
//定义
//Many client specific interfaces are better than one general purpose interface.
//
//即：多个特定的客户端接口要好于一个通用性的总接口。
//
//定义解读
//客户端不应该依赖它不需要实现的接口。
//不建立庞大臃肿的接口，应尽量细化接口，接口中的方法应该尽量少。
//需要注意的是：接口的粒度也不能太小。如果过小，则会造成接口数量过多，使设计复杂化。

/// 付款协议
protocol RestaurantPayment {
    func payOrder() -> Void
}

/// 订餐协议
protocol RestaurantPlaceOrder {
    func placeOrder() -> Void
}

class Client: NSObject, RestaurantPayment, RestaurantPlaceOrder {
    func payOrder() {
        print("\(self)")
    }
    func placeOrder() {
        // 可执行默认操作
        print("\(self)")
    }
}

class OnlineClient: Client {
    override func payOrder() {
        print("payOrder")
    }
    override func placeOrder() {
        print("placeOrder")
    }
}

class TelephoneClient: Client {
    override func payOrder() {
        print("payOrder")
    }
    override func placeOrder() {
        print("placeOrder")
    }
}

class WalkinClient: Client {
    override func payOrder() {
        
    }
    override func placeOrder() {
        
    }
}

