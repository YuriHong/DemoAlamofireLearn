//
//  AlamofireComponent.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/6.
//  Copyright © 2018年 TRS. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

typealias RequestComponent = Component.AlamofireComponent
typealias NetworkReachComponent = Component.NetWorkReachable

protocol LoadViewConvertible where Self: UIView {
    func pushLoad() -> Void
    func popLoad() -> Void
}

extension LoadViewConvertible {
    
}

protocol AlertViewConvertible {
    func showAlert() -> Void
    func hideAlert() -> Void
}

extension AlertViewConvertible {
    func showAlert() -> Void {}
    func hideAlert() -> Void {}
}

open class Component {
    
    /// 全屏的背景容器类
    class BGContainerComponent {
        private static let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        /// 容器View的tag 方便移除
        private let containerViewTag = Int(Int16.max)
        
        /// 容器View
        private let containerView: UIButton = {
            let bt = UIButton(type: .custom)
            bt.frame = rect
            bt.backgroundColor = .clear
            return bt
        }()
        /// UIApplication 的keyWindow
        private let bgWindow: UIWindow = {
            let w = UIWindow(frame: rect)
            w.windowLevel = .alert - 1
            w.backgroundColor = .clear
            return w
        }()
        
        var bgColor: UIColor = .clear
        
        /// 初始化
        ///
        /// - Parameter load: 需要添加到背景上的view
        init(_ load: UIView) {
            for sub in bgWindow.subviews {
                if sub.tag == containerViewTag {
                    sub.removeFromSuperview()
                }
            }
            containerView.addTarget(self, action: #selector(touchAction(_:)), for: .touchUpInside)
            containerView.tag = containerViewTag
            bgWindow.addSubview(containerView)
            containerView.addSubview(load)
            containerView.isHidden = true
        }
        
        deinit {
            print("移除:contentView")
            containerView.removeFromSuperview()
        }
        
        /// 点击空白处调用
        ///
        /// - Parameter sender: 事件按钮
        @objc fileprivate func touchAction(_ sender: UIButton ) -> Void {
//            self.pop()
        }
        
        func push() {
            bgWindow.bringSubviewToFront(containerView)
            bgWindow.makeKeyAndVisible()
            containerView.isHidden = false
        }
        
        func pop() {
            bgWindow.sendSubviewToBack(containerView)
            containerView.isHidden = true
            bgWindow.resignKey()
            bgWindow.isHidden = true
        }
    }
    
    /// 点击消失组件
    class TouchHidenComponent: BGContainerComponent {
        typealias HidenAction = () -> Void
        var touchHiden: HidenAction?
        init(_ load: UIView, action: HidenAction?) {
            super.init(load)
            pop()
            self.touchHiden = action
        }
        
        override func touchAction(_ sender: UIButton) {
            super.touchAction(sender)
            touchHiden?()
        }
    }
    
    /// 网络加载动画
    class LoadingComponent: BGContainerComponent {
        static let `default` = LoadingComponent()
        private init() {
            let load = UIImageView(frame: CGRect(x: 100, y: 100, width: 130, height: 97))
            load.image = UIImage(named: "load")
            super.init(load)
        }
    }
    
    class NetWorkReachable {
        
        static let manager = NetworkReachabilityManager()
        
        static var isReachable: Bool {
            return NetWorkReachable.manager?.isReachable ?? false
        }
        
        @discardableResult
        static func start(with listener: ((NetworkReachabilityManager.NetworkReachabilityStatus) -> Void)? = nil) -> Bool {
            NetWorkReachable.manager?.listener = listener
            return NetWorkReachable.manager?.startListening() ?? false
        }
    }
    
    /// 网络请求Alamofire组件
    class AlamofireComponent {
        
        static func afRequest(_ url: URLConvertible,
                              method: HTTPMethod = .get,
                              parameters: Parameters? = nil,
                              encoding: ParameterEncoding = URLEncoding.default,
                              headers: HTTPHeaders? = nil) {
            Alamofire.request(url,
                              method: method,
                              parameters: parameters,
                              encoding: encoding,
                              headers: headers)
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        print("success:\(value)")
                    case .failure(let err):
                        print("failure:\(err)")
                    }
            }
        }
        
        static func afRequest(_ url: URLConvertible,
                              method: HTTPMethod = .get,
                              parameters: Parameters? = nil,
                              encoding: ParameterEncoding = URLEncoding.default,
                              headers: HTTPHeaders? = nil,
                              show: Bool,
                              massage: String? = nil)
        {
            
        }
        
        
        static func request() {
            if NetworkReachComponent.isReachable {
                print("网络请求")
                LoadingComponent.default.push()
                Alamofire.request("http://www.scga.gov.cn/app/lmfl/tt/index.json").responseJSON { (response) in
                    print(response)
                    LoadingComponent.default	.pop()
                    switch response.result {
                    case .success(let value):
                        print("success:\(value)")
                    case .failure(let err):
                        print("failure:\(err)")
                    }
                }
            }else {
                print("网络链接已断开")
            }
        }
    }
}

















