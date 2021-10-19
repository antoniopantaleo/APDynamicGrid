import SwiftUI
/**
 Hi I am the title
 */
public struct DynamicGrid<T : Identifiable & Hashable, Content: View> : View {
	
	@Binding var data : [T]
	@Binding var columns : Int
	
	let content: ((T) -> Content)
	
	@State private var map : [Int : [T]] = [:]
	@Namespace private var dynamicGridAnimation
	
		/// Description
		/// - Parameters:
		///   - columns: columns description
		///   - data: data description
		///   - content: content description
	public init(columns: Binding<Int> = .constant(2), data : Binding<[T]>, @ViewBuilder content: @escaping (T) -> Content) {
		self.content = content
		_data = data
		_columns = columns
	}
	
		/// Description
	public var body : some View {
		LazyVStack {
			ForEach(map.keys.sorted(), id:\.self) {i in
				HStack {
					ForEach(map[i]!, id:\.self) {j in
						content(j)
							.matchedGeometryEffect(id: j.id, in: dynamicGridAnimation)
					}
				}
			}
		}
		.onAppear {
			populateMap()
		}
		.onChange(of: columns) { _ in
			guard columns > 0 else {return}
			populateMap()
		}
		.onChange(of: data) { _ in
			populateMap()
		}
		
	}
	
	
	private func populateMap() {
		map = [:]
		var data = self.data
		var idx = 0
		while data.count > 0 {
			var row : [T] = []
			for _ in 0..<columns {
				guard !data.isEmpty else {continue}
				row.append(data.removeFirst())
			}
			map[idx] = row
			idx += 1
		}
	}
}
