import SwiftUI

public struct DynamicGrid<T : Identifiable & Hashable, Content: View> : View {
    
    @Binding var values : [T]
    @Binding var columns : Int
    
    let content: ((T) -> Content)
    
    @State private var gridMap: [Int: [T]] = [:]
    
    private let viewModel = DynamicGridViewModel<T>()
    @Namespace private var dynamicGridAnimation
    
    public init(
        columns: Binding<Int> = .constant(2),
        values : Binding<[T]>,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self._values = values
        self._columns = columns
        self.content = content
    }
    
    private func updateGrid() {
        gridMap = viewModel.getGrid(values: values, columns: columns)
    }
    
    public var body : some View {
        LazyVStack {
            ForEach(gridMap.keys.sorted(), id: \.self) { i in
                HStack {
                    if let items = gridMap[i] {
                        ForEach(items, id: \.self) { j in
                            content(j)
                                .matchedGeometryEffect(
                                    id: j.id,
                                    in: dynamicGridAnimation
                                )
                        }
                    }
                }
            }
        }
        .onAppear { updateGrid() }
        .onChange(of: columns) { columns in
            guard columns > 0 else { return }
            updateGrid()
        }
        .onChange(of: values) { _ in updateGrid() }
        .drawingGroup()
    }
    
}
