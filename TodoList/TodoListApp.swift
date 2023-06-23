//
//  TodoListApp.swift
//  TodoList
//
//  Created by Omkar Anarse on 04/06/23.
//

import SwiftUI

/*
 MVVM Architecture
 
 M --> Model
 V --> UI
 VM -> manages model for view
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
                ListView().environmentObject(listViewModel)
        }
    }
}
