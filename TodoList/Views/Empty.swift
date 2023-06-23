//
//  Empty.swift
//  TodoList
//
//  Created by Omkar Anarse on 22/06/23.
//

import SwiftUI

struct Empty: View {
    
    @State var animate: Bool = false
    let secondColor = Color("Second")
    
    var body: some View {
        ScrollView{
            VStack{
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Start adding todo items to your list by clicking the below add button 📝 and be more productive 🔥")
                NavigationLink {
                    AddView()
                } label: {
                    Text("Start Adding 🚀")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(20)
                        .padding(.horizontal)
                        .background(animate ? secondColor : Color.accentColor)
                        .cornerRadius(20)
                }
                .padding(animate ? 30 : 50)
                .shadow(color: animate ? secondColor : Color.accentColor,
                        radius: animate ? 30 : 10,
                        x: 10,
                        y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            withAnimation (
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct Empty_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Empty()
                .navigationTitle("Title")
        }

    }
}
