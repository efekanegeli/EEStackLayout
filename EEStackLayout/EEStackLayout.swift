//
//  EEStackLayout.swift
//  EEStackLayout
//
//  Created by Efekan Egeli on 5.06.2018.
//  Copyright © 2018 Efekan Egeli. All rights reserved.
//

import UIKit

open class EEStackLayout: UIStackView {
    
    // MARK: Private Logical Variables
    private var privateTotalSubviewWidth = CGFloat(0)
    private var privateRowView = UIView()
    private var privatePreviousSubview = UIView()
    private var privateTotalSubviewWidthWithSpacings = CGFloat(0)
    
    // MARK: Private UI Related Variables
    private var privateRowHeight = CGFloat(0)
    private var privateSubviewHeight = CGFloat(0)
    private var privateSpacingBetweenSubviews = CGFloat(0)
    private var privateLeftPadding = CGFloat(0)
    private var privateRightPadding = CGFloat(0)
    
    // MARK: Initializers
    public init(frame: CGRect, rowHeight: CGFloat, subviewHeight: CGFloat, spacingBetweenSubviews: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat, subviews: [UIView]) {
        super.init(frame: frame)
        setupMainStackView()
        setupRowProperties(rowHeight: rowHeight, subviewHeight: subviewHeight, spacingBetweenSubviews: spacingBetweenSubviews, leftPadding: leftPadding, rightPadding: rightPadding)
        setupLayout(subviews: subviews)
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Property Setup
    private func setupMainStackView() {
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 0
        self.axis = .vertical
    }
    
    private func setupRowProperties(rowHeight: CGFloat, subviewHeight: CGFloat, spacingBetweenSubviews: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        privateRowHeight = rowHeight
        privateSubviewHeight = subviewHeight
        privateSpacingBetweenSubviews = spacingBetweenSubviews
        privateLeftPadding = leftPadding
        privateRightPadding = rightPadding
    }
    
    // MARK: Layout Setup
    private func setupLayout(subviews: [UIView]) {
        addNewRow()
        for subview in subviews {
            if doesSubviewFitInRow(subview: subview) {
                addSubviewToRow(subview: subview)
            } else {
                addNewRow()
                addSubviewToRow(subview: subview)
            }
        }
    }
    
    // MARK: Row Operations
    private func doesSubviewFitInRow(subview: UIView) -> Bool {
        privateTotalSubviewWidthWithSpacings = CGFloat(privateRowView.subviews.count - 1) * privateSpacingBetweenSubviews + privateTotalSubviewWidth
        let totalPadding = privateLeftPadding + privateRightPadding
        if privateTotalSubviewWidthWithSpacings > 0 &&
            self.frame.size.width - (privateTotalSubviewWidthWithSpacings + totalPadding) < subview.frame.size.width + privateSpacingBetweenSubviews {
            return false
        } else {
            return true
        }
    }
    
    private func addSubviewToRow(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        privateRowView.addSubview(subview)
        privateTotalSubviewWidth += subview.frame.size.width
        if privateRowView.subviews.count == 1 {
            subview.leadingAnchor.constraint(equalTo: privateRowView.leadingAnchor, constant: privateLeftPadding).isActive = true
        } else {
            subview.leadingAnchor.constraint(equalTo: privatePreviousSubview.trailingAnchor, constant: privateSpacingBetweenSubviews).isActive = true
        }
        subview.heightAnchor.constraint(equalToConstant: privateSubviewHeight).isActive = true
        subview.widthAnchor.constraint(equalToConstant: subview.frame.size.width).isActive = true
        subview.centerYAnchor.constraint(equalTo: privateRowView.centerYAnchor).isActive = true
        privatePreviousSubview = subview
    }
    
    private func addNewRow() {
        privateTotalSubviewWidth = 0
        privateRowView = UIView()
        privateRowView.backgroundColor = .brown
        privateRowView.heightAnchor.constraint(equalToConstant: privateRowHeight).isActive = true
        self.addArrangedSubview(privateRowView)
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height + CGFloat(privateRowHeight))
    }
}
