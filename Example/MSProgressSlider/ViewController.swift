//
//  ViewController.swift
//  MSProgressSlider
//
//  Created by messeb on 03/04/2016.
//  Copyright (c) 2016 messeb. All rights reserved.
//

import UIKit
import MSProgressSlider

class ViewController: UIViewController {
    
    @IBOutlet weak var storyBoardProgressSlider: MSProgressSlider!
    var codeProgressSlider: MSProgressSlider?
    
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1)
        
        addProgressSlider()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        startProgressTimer()
    }
    
    func onTimerProgress(timer: NSTimer) {
        guard let codeProgressSlider = self.codeProgressSlider else {
            self.timer?.invalidate()
            return
        }
        
        if codeProgressSlider.progressValue > codeProgressSlider.maximumValue {
            codeProgressSlider.progressValue = codeProgressSlider.minimumValue
        }
        
        codeProgressSlider.progressValue += 0.05
        
    }
    
    func startProgressTimer() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "onTimerProgress:", userInfo: nil, repeats: true)
    }
    
    func addProgressSlider() {
        let codeProgressSlider = MSProgressSlider()
        codeProgressSlider.minimumValue = 0.0
        codeProgressSlider.maximumValue = 1.0
        codeProgressSlider.progressValue = 0.5
        codeProgressSlider.value = 0.25
        
        codeProgressSlider.completeColor = UIColor.blueColor()
        codeProgressSlider.progressColor = UIColor.whiteColor()
        codeProgressSlider.valueColor = UIColor.redColor()
        
        self.codeProgressSlider = codeProgressSlider
        
        self.view.addSubview(codeProgressSlider)
    
        let views = Dictionary(dictionaryLiteral: ("storyBoardProgressSlider",storyBoardProgressSlider),("codeProgressSlider",codeProgressSlider))
        self.view.translatesAutoresizingMaskIntoConstraints = false
        codeProgressSlider.translatesAutoresizingMaskIntoConstraints = false
        storyBoardProgressSlider.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(16)-[codeProgressSlider]-(16)-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: views)
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(20)-[storyBoardProgressSlider]-(16)-[codeProgressSlider]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraints + verticalConstraint)
    }
}

