//
//  Entry.swift
//  ExampleApp
//
//  Created by Antonio on 19/10/21.
//

import Foundation

struct Entry : Identifiable, Hashable {
	static let emojis = (0x1F600...0x1F64F)
		.compactMap { UnicodeScalar($0).map(String.init) }
	
	let id = UUID()
	var emoji : String {
		Self.emojis[abs(id.uuidString.hashValue) % Self.emojis.count]
	}
}
