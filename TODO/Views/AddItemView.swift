//
//  AddView.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var listViewModel: ListViewModel
    
    @State private var textFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal, 20)
                    .frame(height: 55)
                    .background(Color.secondary.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    savedButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isTextAppropiate ? Color.blue : Color.gray)
                        )
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🫵")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    var isTextAppropiate: Bool {
        textFieldText.count >= 3
    }
    
    func savedButtonPressed() {
        if isTextAppropiate {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        } else {
            alertTitle = "Oops!"
            alertMessage = "Your item must be at least 3 characters long. 😰😱"
            showAlert.toggle()
        }
    }
    
    func getAlert() -> Alert {
        return(
            Alert(title: Text(alertTitle),
                  message: Text(alertMessage)
                 )
        )
    }
    
}

#Preview {
    NavigationStack {
        AddItemView()
    }
    .environmentObject(ListViewModel())
}
