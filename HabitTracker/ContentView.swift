//
//  ContentView.swift
//  HabitTracker
//
//  Created by Miłosz Tabaka on 01/11/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink {
                        DetailView(activity: item, activities: activities)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(item.title)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(activities: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
