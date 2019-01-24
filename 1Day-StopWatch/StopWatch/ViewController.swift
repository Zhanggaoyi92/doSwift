//
//  ViewController.swift
//  StopWatch
//
//  Created by 屋顶的羊 on 2019/1/24.
//  Copyright © 2019 屋顶的羊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resetBtn : UIButton = UIButton(type: UIButton.ButtonType.custom)
    var startBtn : UIButton = UIButton(type: UIButton.ButtonType.custom)
    var stopBtn : UIButton = UIButton(type: UIButton.ButtonType.custom)
    
    var displayLabel : UILabel = UILabel()
    
    var timer : Timer?
    
    var count : CGFloat = 0.0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        let sWidth = UIScreen.main.bounds.size.width
        let sHeight = UIScreen.main.bounds.size.height
        
        resetBtn.frame = CGRect.init(x: sWidth-100, y: 40, width: 80, height: 40)
        resetBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        resetBtn.setTitle("Reset", for: UIControl.State.normal)
        resetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        resetBtn.addTarget(self, action: #selector(reset), for: UIControl.Event.touchUpInside)
        
        startBtn.frame = CGRect.init(x: 0.0, y: sHeight/2.0, width: sWidth/2.0, height: sHeight/2.0)
        startBtn.backgroundColor = UIColor.blue
        startBtn.addTarget(self, action: #selector(start), for: UIControl.Event.touchUpInside)
        startBtn.setImage(UIImage.init(named: "play"), for: UIControl.State.normal)
        
        stopBtn.frame = CGRect.init(x: sWidth/2.0, y: sHeight/2.0, width: sWidth/2.0, height: sHeight/2.0)
        stopBtn.backgroundColor = UIColor.green
        stopBtn.addTarget(self, action: #selector(stop), for: UIControl.Event.touchUpInside)
        stopBtn.setImage(UIImage.init(named: "pause"), for: UIControl.State.normal)
        
        let dLabelHeight :CGFloat = 100.0
        displayLabel.frame = CGRect.init(x: 0.0, y: (sHeight/2.0 - dLabelHeight)/2.0, width: sWidth, height: dLabelHeight)
        displayLabel.textColor = UIColor.white
        displayLabel.text = "\(count)"
        displayLabel.textAlignment = NSTextAlignment.center
        displayLabel.font = UIFont.systemFont(ofSize: 70.0)
        
        view.addSubview(resetBtn)
        view.addSubview(startBtn)
        view.addSubview(stopBtn)
        view.addSubview(displayLabel)
    }

    @objc func reset() {
        timer?.invalidate()
        
        stopBtn.isEnabled = true
        startBtn.isEnabled = true
        
        count = 0.0
        displayLabel.text = String(format: "%.1f", count)
    }

    @objc func start() {
        timer = Timer(timeInterval: 0.1, target: self, selector: #selector(run), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        
        stopBtn.isEnabled = true
        startBtn.isEnabled = false
    }
    
    @objc func stop() {
        timer?.invalidate()
        
        stopBtn.isEnabled = false
        startBtn.isEnabled = true
    }
    
    @objc func run() {
        count += 0.1
        displayLabel.text = String(format: "%.1f", count)
    }
}

