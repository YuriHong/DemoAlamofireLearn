//
//  LawOfDemeter.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation

//原则五：迪米特法则（Law of Demeter）
//定义
//You only ask for objects which you directly need.
//
//即：一个对象应该对尽可能少的对象有接触，也就是只接触那些真正需要接触的对象。
//
//定义解读
//迪米特原则也叫做最少知道原则（Least Know Principle）， 一个类应该只和它的成员变量，方法的输入，返回参数中的类作交流，而不应该引入其他的类（间接交流）。

class Car: NSObject {
    private var engine: GasEngine
    init(_ engine: GasEngine) {
        self.engine = engine
        super.init()
    }
    
    func usingEngineBrandName() -> String {
        return engine.brand
    }
}

class GasEngine: NSObject {
    var brand: String = ""
}


