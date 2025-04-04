//
//  ListView.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

import SwiftUI

struct ListView: View {
    
    @State private var items: [String] = [
        "This is the first title!!!",
        "This is the second title!!!",
        "This is the third title!!!",
        "This is the fourth title!!!",
        "This is the fifth title!!!",
        "This is the sixth title!!!",
        "This is the seventh title!!!",
        "This is the eighth title!!!"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}


