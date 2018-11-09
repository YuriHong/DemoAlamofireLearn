//
//  SimpleFactoryPattern.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation
import UIKit

//2.11 简单工厂模式
//模式定义
//简单工厂模式(Simple Factory Pattern)：专门定义一个类（工厂类）来负责创建其他类的实例。可以根据创建方法的参数来返回不同类的实例，被创建的实例通常都具有共同的父类。

//2.12 工厂方法模式模式
//模式定义
//工厂方法模式(Factory Method Pattern)又称为工厂模式，工厂父类负责定义创建产品对象的公共接口，而工厂子类则负责生成具体的产品对象，即通过不同的工厂子类来创建不同的产品对象。

enum PhoneBrand: String {
    case unkonw
    case iPhone
    case huaWei
    case xiaoMi
}

// 类簇

class Phone: NSObject {
    var name: String = ""
    var brand: PhoneBrand = .unkonw
    var size: CGSize = CGSize()
    fileprivate override init() {
         super.init()
    }
    
    static func phone(_ brand: PhoneBrand) -> Phone {
        switch brand {
        case .huaWei:
            return HWPhone()
        case .iPhone:
            return IPhone()
        case .xiaoMi:
            return XMPhone()
        case .unkonw:
            return Phone()
        }
    }
    
    func send(_ message: String) -> Void {
        fatalError("implemented by subclass")
    }
}

fileprivate final class IPhone: Phone {
    
    var type: String = ""
    
    override init() {
        super.init()
        self.brand = .iPhone
        self.type = "Hello IPhone"
    }
    
    override func send(_ message: String) {
        print("\(self) \(self.brand.rawValue) send msg: \(message)")
    }
}

fileprivate final class XMPhone: Phone {
    override init() {
        super.init()
        self.brand = .xiaoMi
    }
    override func send(_ message: String) {
        print("\(self) \(self.brand.rawValue) send msg: \(message)")
    }
}

fileprivate final class HWPhone: Phone {
    override init() {
        super.init()
        self.brand = .huaWei
    }
    override func send(_ message: String) {
        print("\(self) \(self.brand.rawValue) send msg: \(message)")
    }
}


