//
//  DependencyInnversionPrinciple.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/8.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation

//原则三：依赖倒置原则（Dependency Inversion Principle）
//定义
//Depend upon Abstractions. Do not depend upon concretions.
//Abstractions should not depend upon details. Details should depend upon abstractions
//High-level modules should not depend on low-level modules. Both should depend on abstractions.
//即：
//
//依赖抽象，而不是依赖实现。
//抽象不应该依赖细节；细节应该依赖抽象。
//高层模块不能依赖低层模块，二者都应该依赖抽象。
//定义解读
//针对接口编程，而不是针对实现编程。
//尽量不要从具体的类派生，而是以继承抽象类或实现接口来实现。
//关于高层模块与低层模块的划分可以按照决策能力的高低进行划分。业务层自然就处于上层模块，逻辑层和数据层自然就归类为底层。

protocol Developerable {
    func writeCode() -> Void
}

extension Developerable {
    func writeCode() -> Void {
        
    }
}

class Project: NSObject {
    private var developers: [Developerable]
    
    init(_ developers: [Developerable]) {
        // 先初始化自身属性，再调用父类初始化方法
        self.developers = developers
        super.init()
    }
    
    func startDeveloping() -> Void {
        developers.forEach { $0.writeCode() }
    }
}

class JavaDeveloper: NSObject {
    
}

extension JavaDeveloper: Developerable {
    func writeCode() {
        print("write java code")
    }
}

class SwiftDeveloper: NSObject {
    
}

extension SwiftDeveloper: Developerable {
    func writeCode() {
        print("write swift code")
    }
}
