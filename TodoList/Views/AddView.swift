//
//  AddView.swift
//  TodoList
//
//  Created by Omkar Anarse on 04/06/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    
    var body: some View {
        NavigationView(content: {
            ScrollView {
                VStack {
                    
                    TextField("Add...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                        .cornerRadius(30)
                    
                    Button {
                        saveButtonPressed()
                    } label: {
                        Text("SAVE")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.black)
                            .cornerRadius(30)
                    }

                }
                .padding(10)
            }
            .navigationTitle("Add Todo items ✍️")
        })
        .padding(20)
    }
    
    func saveButtonPressed(){
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView().environmentObject(ListViewModel())
    }
}
