//
//  LiskovSubstitutionPrinciple.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation

//原则六：里氏替换原则（Liskov Substitution Principle）
//定义
//In a computer program, if S is a subtype of T, then objects of type T may be replaced with objects of type S (i.e. an object of type T may be substituted with any object of a subtype S) without altering any of the desirable properties of the program (correctness, task performed, etc.)
//
//即：所有引用基类的地方必须能透明地使用其子类的对象，也就是说子类对象可以替换其父类对象，而程序执行效果不变。
//
//定义的解读
//在继承体系中，子类中可以增加自己特有的方法，也可以实现父类的抽象方法，但是不能重写父类的非抽象方法，否则该继承关系就不是一个正确的继承关系。





