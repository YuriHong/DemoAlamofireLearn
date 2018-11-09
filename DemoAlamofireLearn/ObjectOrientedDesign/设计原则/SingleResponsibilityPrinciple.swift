//
//  SingleResponsibilityPrinciple.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/8.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation

//原则二：单一职责原则（Single Responsibility Principle）
//定义
//A class should have a single responsibility, where a responsibility is nothing but a reason to change.
//
//即：一个类只允许有一个职责，即只有一个导致该类变更的原因。
//
//定义的解读
//类职责的变化往往就是导致类变化的原因：也就是说如果一个类具有多种职责，就会有多种导致这个类变化的原因，从而导致这个类的维护变得困难。
//
//往往在软件开发中随着需求的不断增加，可能会给原来的类添加一些本来不属于它的一些职责，从而违反了单一职责原则。如果我们发现当前类的职责不仅仅有一个，就应该将本来不属于该类真正的职责分离出去。
//
//不仅仅是类，函数（方法）也要遵循单一职责原则，即：一个函数（方法）只做一件事情。如果发现一个函数（方法）里面有不同的任务，则需要将不同的任务以另一个函数（方法）的形式分离出去。

class Employee: NSObject {
    var name: String = ""
    var address: String = ""
    var employeeID: String = ""
}

//财务部门职责
class FinancialApartment: NSObject {
    
    /// 计算薪水
    ///
    /// - Parameter employee: 员工
    /// - Returns: 薪水
    func calculateSalary(_ employee: Employee) -> Double {
        return 0.0
    }
}

//人力资源部门
class HRApartment: NSObject {
    
    /// 决定雇员是否晋升
    ///
    /// - Parameter employee: 员工
    /// - Returns: true = 晋升
    func willGetPromotionThisYear(_ employee: Employee) -> Bool {
        return true
    }
}
