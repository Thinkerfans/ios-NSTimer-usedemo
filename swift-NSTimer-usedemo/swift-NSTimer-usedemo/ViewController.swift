//
//  ViewController.swift
//  swift-NSTimer-usedemo
//
//  Created by apple on 15-1-3.
//  Copyright (c) 2015年 thinker. All rights reserved.
//

import UIKit

/*
创建定时器对象有两种方式：
方式一：通过NSTimer类方法schedulTimerWithTimeInteval
方式二：通过NSTimer构造函数
*/



class ViewController: UIViewController {
    
    
    // 暂停定时器
    func timerPause(timer: NSTimer){
        timer.fireDate = NSDate.distantFuture() as NSDate
    }
    
    // 开启定时器
    func timerResume(timer: NSTimer){
        timer.fireDate = NSDate.distantPast() as NSDate
    }
    
    // 关闭定时器
    func timerDestory(timer: NSTimer){
        timer.invalidate()
    }
    
    // 创建定时器并开启记时
    func timerCreate(){
        timer2 = NSTimer(timeInterval: 5, target: self, selector: "doSecondTask:", userInfo: nil, repeats: true)//创建
        NSRunLoop.currentRunLoop().addTimer(timer2, forMode: NSRunLoopCommonModes)//开始记时
    }
    
    
    
    var timer1: NSTimer!
    var timer2: NSTimer!
    
    @IBAction func firstTimerOperate(sender: UIButton) {
        
        println(sender.titleLabel?.text)
        
        if sender.titleLabel?.text! == "启动定时器一"{
            if timer1 == nil{
                initTimer1()
            }
            sender.setTitle("关闭定时器", forState: UIControlState.Normal)
        }else{
            
            timerDestory(timer1) // 关闭定时器
            timer1 = nil
            sender.setTitle("启动定时器一", forState: UIControlState.Normal)
            
        }
    }
    
    @IBAction func secondTimerOperate(sender: UIButton) {
        println(sender.titleLabel?.text)
        
        if sender.titleLabel?.text! == "开始定时器二"{
            if timer2 == nil{
                initTimer2()
            }else{
                timerPause(timer2)
            }
            sender.setTitle("暂停定时器二", forState: UIControlState.Normal)
        }else{
            
            timerResume(timer2);
            sender.setTitle("开始定时器二", forState: UIControlState.Normal)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        initTimer()
    }
    
    func doFirstTask(timer: NSTimer){
        println("\(timer) : do first task")
    }
    
    func doSecondTask(timer: NSTimer){
        println("\(timer) : do second task")
    }
    
    
    func initTimer1(){
        timer1 = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "doFirstTask:", userInfo: nil, repeats: true)
    }
    
    func initTimer2(){
        timer2 = NSTimer(timeInterval: 5, target: self, selector: "doSecondTask:", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer2, forMode: NSRunLoopCommonModes)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

