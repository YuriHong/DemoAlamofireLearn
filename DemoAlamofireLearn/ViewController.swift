//
//  ViewController.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/6.
//  Copyright © 2018年 TRS. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let load = UIImageView(frame: CGRect(x: 100, y: 100, width: 130, height: 97))
    var loadCom: Component.BGContainerComponent!
    var touchHiden: Component.TouchHidenComponent!
    
    let testStringOne = "testStringOne"
    let testStringTwo = "testStringTwo"
    let testStringThr = "testStringThr"
    var count: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadCom = Component.BGContainerComponent.init(load)
        touchHiden = Component.TouchHidenComponent(load, action: {
            print("Hiden")
        })
        
        let reachable = NetworkReachabilityManager(host: "https://www.baidu.com")
        reachable?.listener = {status in
            print("1 \(status)")
            switch status {
            case .reachable(let type):
                print(type)
            default:
                print("无法到达")
            }
        }
        reachable?.startListening()
        
        let reach2 = NetworkReachabilityManager()
        reach2?.listener = {status in
            print("2 \(status)")
            switch status {
            case .reachable(let type):
                print(type)
            default:
                print("无法到达")
            }
        }
        reach2?.startListening()
        
//        Component.AlamofireComponent.request()
//        Component.NetWorkReachable.startListening()
//        Component.NetWorkReachable.start { (status) in
//            print("3 \(status)")
//            switch status {
//            case .reachable(let type):
//                print(type)
//            default:
//                print("无法到达")
//            }
//        }
        Component.NetWorkReachable.start()
        
//        Component.LoadComponent(load: UIView())
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(1)) {
//            RequestComponent.request()
//        }

        example("Phone") {
            let p = Phone.phone(.iPhone)
            p.name = "iPhone"
            p.size = CGSize(width: 375, height: 667)
            p.send("Hello world")
        }
    }

    @IBAction func testAction(_ sender: UIButton) {
//        RequestComponent.request()
//        load.image = UIImage(named: "load")
        
//        loadCom.push()
//        touchHiden.push()
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
////            loadCom.popLoad()
//        }
        
        example("Swift runtime") {
            let swiftClass = TestASwiftClass()
//            let proList = class_copyPropertyList(object_getClass(swiftClass), &count)
            let proList = class_copyPropertyList(object_getClass(self), &count)
            for i in 0..<numericCast(count) {
                let property = property_getName(proList![i]);
                print("属性成员属性:%@",String.init(utf8String: property) ?? "没有找到你要的属性");
            }
        }
        
    }
    
}

func example(_ des: String, excute: () -> ()) {
    print("---->\(des) Begin<----")
    excute()
    print("---->\(des) End<----")
}

extension UIView {
    private var contentViewTag: Int {
        return -999
    }
    
    var loadBGWindow: UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
    func loadViewConvert() -> Void {
        if let load = loadBGWindow {
            for subV in load.subviews {
                if subV.tag == contentViewTag {
                    subV.removeFromSuperview()
                }
            }
            load.addSubview(self)
            self.isHidden = true
        }
    }
    
    func pushLoad() -> Void {
        if let load = loadBGWindow {
            load.bringSubviewToFront(self)
            self.isHidden = false
        }
    }
    func popLoad() -> Void {
        if let load = loadBGWindow {
            load.sendSubviewToBack(self)
            self.isHidden = true
        }
    }
}


