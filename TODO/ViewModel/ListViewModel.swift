//
//  ListViewModel.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

/// CRUD FUNCTIONS
///  Create
///   Read
///    Update
///    Delete

import Foundation

class ListViewModel: ObservableObject {
    
    let itemsKey: String = "items_list"
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(tittle: "Buy milk", isCompleted: false),
//            ItemModel(tittle: "Learn SwiftUI", isCompleted: true),
//            ItemModel(tittle: "Go for a walk", isCompleted: false),
//            ItemModel(tittle: "Read a book", isCompleted: false),
//            ItemModel(tittle: "Meditate", isCompleted: true),
//            ItemModel(tittle: "Dance", isCompleted: true),
//            ItemModel(tittle: "Cook dinner", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func onMove(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(tittle: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
