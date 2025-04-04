//
//  ListRowView.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ListRowView(title: "This is the first item!!!")
    }
}
