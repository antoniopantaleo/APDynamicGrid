//
//  DynamicGriViewModel.swift
//  
//
//  Created by Antonio on 07/05/23.
//

import Foundation

class DynamicGridViewModel<T: Identifiable & Hashable> {
    
    func getGrid(values: [T], columns: Int) -> [Int: [T]] {
        guard columns > 0 else { return [:] }
        var gridMap: [Int: [T]] = [:]
        var values = values
        var idx = 0
        
        while !values.isEmpty {
            gridMap[idx] = Array(values.prefix(columns))
            values.removeFirst(min(columns, values.count))
            idx += 1
        }
        
        return gridMap
    }
}
