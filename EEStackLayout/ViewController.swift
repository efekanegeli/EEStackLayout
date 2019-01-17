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
        
        // Subviews that will be added to stack layout
        var viewArray = [UIView]()
        
        // Choose the orientation of EEStackLayout -> vertical / horizontal [Just for demo purposes, change it if you want to see how horizontal EEStackLayout works]
        let targetOrientationOfStackLayout = NSLayoutConstraint.Axis.vertical
        
        let stackLayout: EEStackLayout
        
        if targetOrientationOfStackLayout == .vertical {
            // Vertical EEStackLayout
            
            // Views with same height for the vertical layout
            for _ in 1...25 {
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
            
            // Vertical EEStackLayout setup
            stackLayout = EEStackLayout(frame: CGRect(x: 0, y: 50, width: 300, height: 0),
                                        rowHeight: 20,
                                        minimumInteritemSpacing: 15,
                                        minimumItemSpacing: 10,
                                        insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15),
                                        subviews: viewArray)
            
        } else {
            // Horizontal EEStackLayout
            
            // Views with same width for the horizontal layout
            for _ in 1...25 {
                let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 15))
                view1.backgroundColor = .green
                let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
                view2.backgroundColor = .blue
                let view3 = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 35))
                view3.backgroundColor = .yellow
                let view4 = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 45))
                view4.backgroundColor = .black
                viewArray.append(view1)
                viewArray.append(view2)
                viewArray.append(view3)
                viewArray.append(view4)
            }
            
            // Horizontal EEStackLayout setup
            stackLayout = EEStackLayout(frame: CGRect(x: 0, y: 50, width: 0, height: 400),
                                        columnWidth: 20,
                                        minimumInteritemSpacing: 15,
                                        minimumItemSpacing: 10,
                                        insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15),
                                        subviews: viewArray)
        }
        
        self.view.addSubview(stackLayout)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

