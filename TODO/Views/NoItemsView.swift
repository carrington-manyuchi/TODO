//
//  ItemsView.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                VStack {
                    Text("They are no items!")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Are you a productive person? I think you should click the add button and  add a bunch of items to your todo Lists!")
                }
                
                VStack {
                    NavigationLink(destination: AddItemView()) {
                        Text("Add Something ✍️")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? .red : Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? .red.opacity(0.7) :
                                Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                }
               
            }
            .padding(40)
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
            .navigationTitle("Title")
    }
}
