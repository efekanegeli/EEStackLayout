//
//  Tests.swift
//  EEStackLayoutTests
//
//  Created by Efekan Egeli on 11.09.2018.
//  Copyright © 2018 Efekan Egeli. All rights reserved.
//

import XCTest

class Tests: XCTestCase {
    
    var viewArray = [UIView]()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_seven_lines_stack_layout() {
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
        
        XCTAssertTrue(stackLayout.subviews.count == 7)
    }
    
    func test_single_line_stack_layout() {
        for _ in 1...1 {
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
        
        
        let stackLayout = EEStackLayout(frame: CGRect(x: 0, y: 50, width: 250, height: 0),
                                        rowHeight: CGFloat(42),
                                        subviewHeight: CGFloat(20),
                                        spacingBetweenSubviews: CGFloat(15),
                                        leftPadding: CGFloat(15),
                                        rightPadding: CGFloat(15),
                                        subviews:viewArray)
        
        XCTAssertTrue(stackLayout.subviews.count == 1)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
