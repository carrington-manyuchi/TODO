//
//  ListRowView.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
            HStack {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundStyle(item.isCompleted ? .green : .red)
                Text(item.tittle)
            }
            .font(.title2)
            .padding(.vertical,8)
    }
    
}

#Preview {
    NavigationStack {
        ListRowView(item: ItemModel(tittle: "This is the first item!!!", isCompleted: false))
    }
}
