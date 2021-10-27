# APDynamicGrid

![Package Presentation Image](Assets/APDynamicGrid.png)

## Overview 

<img src="Assets/demo.gif" align="right" width="300"/>

`APDynamicGrid` is a SwiftUI package that helps you create consistent and animatable grids. The `DynamicGrid` View preserves the same width, adjusting the last elements consistently.

## Usage

Define your model adopting the `Hashable` and `Identifiable` protocols

```swift
struct Entry : Identifiable, Hashable {
  let id = UUID()
  // ...
}
```
and wrap it with the `@State` decorator

```swift
var body : some View {
  
  private @State var entries : [Entry]
  // number of columns is a @State var too
  private @State var columns : Int
  
  ScrollView {
    DynamicGrid(columns: $columns, data: $entries) { entry in 
      MyCustomCell(entry: entry)
    }
  }
}
```
Entries can be animated registering a `@Namespace` with the unique `id`

```swift
var body : some View {
  
  private @State var entries : [Entry]
  private @State var columns : Int
  // add a namespace
  private @Namespace var namespace
  
  ScrollView {
    DynamicGrid(columns: $columns, data: $entries) { entry in 
      MyCustomCell(entry: entry)
      // register the namespace
      .matchedGeometryEffect(id: entry.id, in: namespace)
    }
    // apply animations
    .animation(.default)
  }
}
```

## Installation

### Xcode Project

You have to select `File` -> `Swift Packages` -> `Add Package Dependency` and enter the repository url `https://github.com/antoniopantaleo/APDynamicGrid.git`

### Swift Package Manager

You have to add the package as a dependency in your `Package.swift` file
```swift
let package = Package(
    //...
    dependencies: [
        .package(url: "https://github.com/antoniopantaleo/APDynamicGrid.git", upToNextMajor(from: "1.0.0")),
    ],
    //...
)
```

## License
[MIT](LICENSE.txt)
