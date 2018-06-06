# EEStackLayout

A vertical stackview which takes subviews with different widths and adds them to it's rows with paddings, spacings etc.

![Screenshot](https://github.com/efekanegeli/EEStackLayout/blob/master/example1.png)

## Installation

### Cocoapods (recommended)

```
pod 'EEStackLayout', '~> 0.1'
pod install
```

### Manual

```
1. Download .zip file
2. Just drag and drop EEStackLayout.swift to your project
```

## Example Usage

```
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

let stackLayout = EEStackLayout(frame: CGRect(x: 0, y: 0, width: 380, height: 0),
                                        rowHeight: CGFloat(42),
                                        subviewHeight: CGFloat(20),
                                        spacingBetweenSubviews: CGFloat(15),
                                        leftPadding: CGFloat(15),
                                        rightPadding: CGFloat(15),
                                        subviews:viewArray)
self.view.addSubview(stackLayout)
```

## Init Properties
```
rowHeight -> Row height of the main vertical stack view
subviewHeight -> Height of the subviews which will be added to the rows
spacingBetweenSubviews -> Space between subviews within the same row
leftPadding -> Left padding of first subview in the rows
rightPadding -> Right padding of the last subview in the rows
subviews -> View array of elements to be added to the main stack view
```

## License

MIT License, Copyright (c) 2018 Efekan Egeli, [@efekanegeli](https://twitter.com/efekanegeli)
