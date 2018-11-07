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
    }

    @IBAction func testAction(_ sender: UIButton) {
        RequestComponent.request()
//        load.image = UIImage(named: "load")
        
//        loadCom.push()
//        touchHiden.push()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
//            loadCom.popLoad()
        }
    }
    
}

func example(_ des: String, excute: () -> ()) {
    print("---->\(des)<----")
    excute()
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


