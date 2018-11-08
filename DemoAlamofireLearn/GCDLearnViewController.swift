//
//  GCDLearnViewController.swift
//  DemoAlamofireLearn
//
//  Created by TRS on 2018/11/7.
//  Copyright © 2018年 TRS. All rights reserved.
//

import UIKit

class GCDLearnViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gcdTest(_ sender: UIButton) {
//        let task = DispatchWorkItem {
//            print("can cancel")
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: task)
//        task.cancel()
        
//        多个任务全部结束后做一个全部结束的处理
//        async(group:)：用来监视一组block对象的完成，你可以同步或异步地监视
//        notify()：用来汇总结果，所有任务结束汇总，不阻塞当前线程
//        wait()：等待直到所有任务执行结束，中途不能取消，阻塞当前线程
        example("多个任务全部结束后做一个全部结束的处理") {
            RunLoop.Mode.common
            let queue = DispatchQueue.global(qos: .default)
            let group = DispatchGroup()
            queue.async {
                sleep(3)
                print("block1")
            }
            queue.async(group: group) {
                sleep(2)
                print("block2")
            }
            queue.async(group: group) {
                sleep(1)
                print("block3")
            }
            queue.async(group: group) {
                sleep(0)
                print("block4")
            }
            group.notify(queue: .global()) {
                print("group Done")
            }

        }
//        9，concurrentPerform 指定次数的Block最加到队列中
//
//        DispatchQueue.concurrentPerform函数是sync函数和Dispatch Group的关联API。按指定的次数将指定的Block追加到指定的Dispatch Queue中，并等待全部处理执行结束。
//        因为concurrentPerform函数也与sync函数一样，会等待处理结束，因此推荐在async函数中异步执行concurrentPerform函数。concurrentPerform函数可以实现高性能的循环迭代。
        example("concurrentPerform 指定次数的Block最加到队列中") {
            let queue = DispatchQueue.global(qos: .default)
            queue.async {
                DispatchQueue.concurrentPerform(iterations: 7, execute: { (index) in
                    print(index)
                })
                DispatchQueue.main.async {
                    print("done")
                }
            }
        }
        
        example("Semaphore") {
            let semaphore = DispatchSemaphore(value: 1)
            semaphore.signal()
            print("Semaphore11")
        }
//        https://www.jianshu.com/p/2d57c72016c6
        example("3.1 队列的创建方法/获取方法") {
            let cQueue = DispatchQueue(label: "queue.learn", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)
//            let sQueue = DispatchQueue(label: "queue.s.learn", qos: .default, attributes: DispatchQueue.Attributes.)
            let mainQueue = DispatchQueue.main
            let gQueue = DispatchQueue.global(qos: .default)
            
            cQueue.sync {
                for index in 0...3 {
                    sleep(1)
                    print(Thread.current.description + "index:\(index)")
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
