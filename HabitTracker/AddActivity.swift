//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Miłosz Tabaka on 01/11/2022.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var titleAlert = false
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .toolbar {
                Button("Save") {
                    let activityItem = Activity(title: title, description: description)
                    if title != "" {
                        activities.items.append(activityItem)
                        dismiss()
                    } else {
                        titleAlert = true
                    }
                    
                }
            }
            .navigationTitle("Add new activity")
            .alert("Title is required", isPresented: $titleAlert) {
                Button("OK", role: .cancel) {
                    
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activities: Activities())
    }
}
