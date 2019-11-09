# EEStackLayout

A vertical stackview which takes subviews with different widths and adds them to it's rows with paddings, spacings etc.


[![Twitter: @efekanegeli](https://img.shields.io/badge/contact-%40efekanegeli-blue.svg)](https://twitter.com/efekanegeli)
[![CocoaPods](https://img.shields.io/badge/pod-v0.1.11-blue.svg)](https://github.com/efekanegeli/EEStackLayout)

![Screenshot](https://github.com/efekanegeli/EEStackLayout/blob/master/example1.png)

## Installation

### Cocoapods

```
pod 'EEStackLayout', '~> 0.1'
pod install
```

### Swift Package Manager

```
.package(url: "https://github.com/efekanegeli/EEStackLayout.git", from: "0.1.11")
```

### Manual

```
1. Download .zip file
2. Just drag and drop EEStackLayout.swift to your project
```

## Example Usage

```swift
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
```

## Init Properties
```
minimumItemSpacing -> Spacing between rows(vertical layout) or colums(horizontal layout)
rowHeight -> Row height of the main vertical stack view
maximumRowCount -> Maximum row count of the vertical stack view, ignores the rest of the subviews if the actual row count exceeds the limit
columnWidth -> Column width of the main horizontal stack view
maximumColumnCount -> Maximum column count of the horizontal stack view, ignores the rest of the subviews if the actual column count exceeds the limit
minimumInteritemSpacing -> Spacing between items in a row/column
insets -> Layout margins of main vertical stack view
subviews -> View array of elements to be added to the main stack view
```

## License

MIT License, Copyright (c) 2018 Efekan Egeli, [@efekanegeli](https://twitter.com/efekanegeli)
