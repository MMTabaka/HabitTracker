//
//  DetailView.swift
//  HabitTracker
//
//  Created by Miłosz Tabaka on 02/11/2022.
//

import SwiftUI

struct DetailView: View {
    let activity: Activity
    @ObservedObject var activities: Activities
    
    var body: some View {
        NavigationView {
            VStack {
                Text(activity.description)
                Text("\(activity.counter)")
                Button {
                    var activity2 = activity
                    activity2.counter += 1
                    if let i = activities.items.firstIndex(of: activity) {
                        activities.items[i] = activity2
                    }
                    
                } label: {
                    Image(systemName: "plus.app")
                }
            }
                .navigationTitle(activity.title)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activity: Activity(title: "Swimming", description: "Swimming is fun"), activities: Activities())
    }
}
