//
//  ContentView.swift
//  ExampleApp
//
//  Created by Antonio on 19/10/21.
//

import SwiftUI
import APDynamicGrid

struct ContentView: View {
	
	@State private var columns = 2
	@State private var entries : [Entry] = (0..<6).map {_ in Entry() }
	@Namespace private var myNamespace
	
	var body: some View {
		
		NavigationView {
			ScrollView {
				VStack(spacing: 20) {
					Stepper(value: $columns, in: 1...5) {
						VStack(alignment:.leading) {
							Text("Number of columns: **\(columns)**")
							Text("Number of items: **\(entries.count)**")
						}
                    }
					DynamicGrid(columns: $columns, data: $entries) { entry in
						ZStack {
							Rectangle()
                                .foregroundColor(.white)
							Text(entry.emoji)
								.font(.system(size: 25))
						}
						.frame(height:50)
						.cornerRadius(5)
						.matchedGeometryEffect(id: entry.id, in: myNamespace)
						.onTapGesture { entries.removeAll {$0.id == entry.id} }
					}
					.animation(.spring(response:0.5,dampingFraction:0.7))
					
				}
				.padding(.horizontal)
			}
			.toolbar(content: {
				ToolbarItemGroup(placement: .navigationBarTrailing) {
					Button { entries.append(Entry()) } label: {
						Text("Add item")
							.padding(5)
                            .background(Color.black)
							.foregroundColor(.white)
							.cornerRadius(5)
					}
				}
			})
			.navigationTitle("Dynamic Grid")
		}
        .foregroundColor(.white)
    }
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice(.init(rawValue: "iPhone 13 mini"))
	}
}
