//
//  ViewController.swift
//  EEStackLayout
//
//  Created by Efekan Egeli on 5.06.2018.
//  Copyright © 2018 Efekan Egeli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .orange
        
        var viewArray = [UIView]()
        
        for _ in 1...5 {
            let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 42))
            view1.backgroundColor = .green
            
            let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 42))
            view2.backgroundColor = .blue
            
            let view3 = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 42))
            view3.backgroundColor = .yellow
            
            let view4 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 42))
            view4.backgroundColor = .black
            
            viewArray.append(view1)
            viewArray.append(view2)
            viewArray.append(view3)
            viewArray.append(view4)
        }
        
        
        let stackLayout = EEStackLayout(frame: CGRect(x: 0, y: 50, width: 200, height: 0),
                                        rowHeight: CGFloat(42),
                                        subviewHeight: CGFloat(20),
                                        spacingBetweenSubviews: CGFloat(15),
                                        leftPadding: CGFloat(15),
                                        rightPadding: CGFloat(15),
                                        subviews:viewArray)
        self.view.addSubview(stackLayout)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

