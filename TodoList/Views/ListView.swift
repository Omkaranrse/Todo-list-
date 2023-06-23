//
//  ListView.swift
//  TodoList
//
//  Created by Omkar Anarse on 04/06/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        
        NavigationView(content: {
            ZStack{
                if listViewModel.items.isEmpty{
                    Empty()
                }
                else{
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                }
            }
            .navigationTitle("Todo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("ADD", destination: {AddView()})
                )
        })
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ListViewModel())
    }
}


