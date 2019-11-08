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
    private var totalSubviewHeight = CGFloat(0)
    private var rowView = UIView()
    private var columnView = UIView()
    private var previousSubview = UIView()
    private var totalSubviewWidthWithSpacings = CGFloat(0)
    private var totalSubviewHeightWithSpacings = CGFloat(0)
    private var maximumColumnCount: Int32 = INT_MAX
    private var maximumRowCount: Int32 = INT_MAX
    private var rowCount: Int32 = 0
    private var columnCount: Int32 = 0
    
    // MARK: Private UI Related Variables
    private var rowHeight: CGFloat = .leastNonzeroMagnitude
    private var columnWidth: CGFloat = .leastNonzeroMagnitude
    private var orientation: NSLayoutConstraint.Axis = .vertical
    private let minimumInteritemSpacing: CGFloat
    private let minimumItemSpacing: CGFloat
    private let insets: UIEdgeInsets
    
    // MARK: Initializers
    public init(frame: CGRect,
                columnWidth: CGFloat? = nil,
                maximumColumnCount: Int32? = nil,
                rowHeight: CGFloat? = nil,
                maximumRowCount: Int32? = nil,
                minimumInteritemSpacing: CGFloat,
                minimumItemSpacing: CGFloat,
                insets: UIEdgeInsets,
                subviews: [UIView]) {
        if let heightOfEachRow = rowHeight {
            self.rowHeight = heightOfEachRow
            self.orientation = .vertical
        }
        if let widthOfEachColumn = columnWidth {
            self.columnWidth = widthOfEachColumn
            self.orientation = .horizontal
        }
        if let maxColumnCount = maximumColumnCount {
            self.maximumColumnCount = maxColumnCount
        }
        if let maxRowCount = maximumRowCount {
            self.maximumRowCount = maxRowCount
        }
        
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumItemSpacing = minimumItemSpacing
        self.insets = insets
        super.init(frame: frame)
        setupUI(subviews: subviews)
    }
    
    private func setupUI(subviews: [UIView]) {
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
        self.spacing = minimumItemSpacing
        self.axis = orientation
        self.layoutMargins = insets
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    // MARK: Layout Setup
    private func setupLayout(subviews: [UIView]) {
        if orientation == .vertical {
            addNewRow()
        } else {
            addNewColumn()
        }
        
        for subview in subviews {
            if orientation == .vertical {
                if doesSubviewFitInRow(subview: subview) {
                    addSubviewToRow(subview: subview)
                } else if rowCount < maximumRowCount {
                    addNewRow()
                    addSubviewToRow(subview: subview)
                }
            } else {
                if doesSubviewFitInColumn(subview: subview) {
                    addSubviewToColumn(subview: subview)
                } else if columnCount < maximumColumnCount {
                    addNewColumn()
                    addSubviewToColumn(subview: subview)
                }
            }
        }
        
        if orientation == .vertical {
            let height = (CGFloat(arrangedSubviews.count) * rowHeight) + (CGFloat(arrangedSubviews.count - 1) * minimumItemSpacing) + insets.top + insets.bottom
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: height)
        } else {
            let width = (CGFloat(arrangedSubviews.count) * columnWidth) + (CGFloat(arrangedSubviews.count - 1) * minimumItemSpacing) + insets.left + insets.right
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: width, height: self.frame.size.height)
        }
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
        rowCount += 1
        totalSubviewWidth = insets.left + insets.right
        rowView = UIView()
        rowView.backgroundColor = .clear
        rowView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        self.addArrangedSubview(rowView)
    }
    
    // MARK: Column Operations
    private func doesSubviewFitInColumn(subview: UIView) -> Bool {
        totalSubviewHeightWithSpacings = CGFloat(columnView.subviews.count - 1) * minimumInteritemSpacing + totalSubviewHeight
        if totalSubviewHeightWithSpacings > 0 && self.frame.size.height - totalSubviewHeightWithSpacings < subview.frame.size.height + minimumInteritemSpacing {
            return false
        } else {
            return true
        }
    }

    private func addSubviewToColumn(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        columnView.addSubview(subview)
        totalSubviewHeight += subview.frame.size.height
        if columnView.subviews.count == 1 {
            subview.topAnchor.constraint(equalTo: columnView.topAnchor, constant: insets.top).isActive = true
        } else {
            subview.topAnchor.constraint(equalTo: previousSubview.bottomAnchor, constant: minimumInteritemSpacing).isActive = true
        }
        subview.widthAnchor.constraint(equalToConstant: columnWidth).isActive = true
        subview.heightAnchor.constraint(equalToConstant: subview.frame.size.height).isActive = true
        subview.centerXAnchor.constraint(equalTo: columnView.centerXAnchor).isActive = true
        previousSubview = subview
    }

    private func addNewColumn() {
        columnCount += 1
        totalSubviewHeight = insets.top + insets.bottom
        columnView = UIView()
        columnView.backgroundColor = .clear
        columnView.widthAnchor.constraint(equalToConstant: columnWidth).isActive = true
        self.addArrangedSubview(columnView)
    }
    
    // MARK: Public Methods
    func getRowCount() -> Int {
        return Int(rowCount)
    }
    
    func getColumnCount() -> Int {
        return Int(columnCount)
    }
}
