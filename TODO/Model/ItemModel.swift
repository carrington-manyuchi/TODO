//
//  ItemModel.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let tittle: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString , tittle: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.tittle = tittle
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, tittle: tittle, isCompleted: !isCompleted)
    }
    
    
}


