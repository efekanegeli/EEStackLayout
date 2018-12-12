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
    private var totalSubviewWidth = CGFloat(0)
    private var rowView = UIView()
    private var previousSubview = UIView()
    private var totalSubviewWidthWithSpacings = CGFloat(0)
    
    // MARK: Private UI Related Variables
    private let rowHeight: CGFloat
    private let minimumInteritemSpacing: CGFloat
    private let minimumLineSpacing: CGFloat
    private let insets: UIEdgeInsets
    
    // MARK: Initializers
    public init(frame: CGRect, rowHeight: CGFloat, minimumInteritemSpacing: CGFloat, minimumLineSpacing: CGFloat, insets: UIEdgeInsets, subviews: [UIView]) {
        
        self.rowHeight = rowHeight
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.insets = insets
        
        super.init(frame: frame)
        
        setupMainStackView()
        setupLayout(subviews: subviews)
    }
    
    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Property Setup
    private func setupMainStackView() {
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = minimumLineSpacing
        self.axis = .vertical
        self.layoutMargins = insets
        self.isLayoutMarginsRelativeArrangement = true
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
        let height = (CGFloat(arrangedSubviews.count) * rowHeight) + (CGFloat(arrangedSubviews.count - 1) * minimumLineSpacing) + insets.top + insets.bottom
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: height)
    }
    
    // MARK: Row Operations
    private func doesSubviewFitInRow(subview: UIView) -> Bool {
        totalSubviewWidthWithSpacings = CGFloat(rowView.subviews.count - 1) * minimumInteritemSpacing + totalSubviewWidth
        if totalSubviewWidthWithSpacings > 0 && self.frame.size.width - totalSubviewWidthWithSpacings < subview.frame.size.width + minimumInteritemSpacing {
            return false
        } else {
            return true
        }
    }
    
    private func addSubviewToRow(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        rowView.addSubview(subview)
        totalSubviewWidth += subview.frame.size.width
        if rowView.subviews.count == 1 {
            subview.leadingAnchor.constraint(equalTo: rowView.leadingAnchor, constant: insets.left).isActive = true
        } else {
            subview.leadingAnchor.constraint(equalTo: previousSubview.trailingAnchor, constant: minimumInteritemSpacing).isActive = true
        }
        subview.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        subview.widthAnchor.constraint(equalToConstant: subview.frame.size.width).isActive = true
        subview.centerYAnchor.constraint(equalTo: rowView.centerYAnchor).isActive = true
        previousSubview = subview
    }
    
    private func addNewRow() {
        totalSubviewWidth = insets.left + insets.right
        rowView = UIView()
        rowView.backgroundColor = .clear
        rowView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        self.addArrangedSubview(rowView)
    }
}
