//
//  OpenClosePrinciple.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/8.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation

//定义
//Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.
//
//即：一个软件实体如类、模块和函数应该对扩展开放，对修改关闭。
//
//定义的解读
//用抽象构建框架，用实现扩展细节。
//不以改动原有类的方式来实现新需求，而是应该以实现事先抽象出来的接口（或具体类继承抽象类）的方式来实现


// 原始需求
class Course: NSObject {
    var title: String = ""
    var introduction: String = ""
    var teacherName: String = ""
}

//新增需求  不以改动原有类的方式来实现新需求

class TextCourse: Course {
    var content: String = ""
}

class VideoCourse: Course {
    var videoUrl: String = ""
}

class AudioCourse: Course {
    var audioUrl: String = ""
}

class LiveCourse: Course {
    var liceUrl: String = ""
}




