//
//  AddView.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

import SwiftUI

struct AddView: View {
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 30) {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal, 20)
                    .frame(height: 55)
                    .background(Color.secondary.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                }

                
            }
            .padding(14)
            
        }
        .navigationTitle("Add an item 🫵")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
