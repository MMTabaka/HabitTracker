//
//  Activities.swift
//  HabitTracker
//
//  Created by Miłosz Tabaka on 01/11/2022.
//

import Foundation

class Activities: ObservableObject {
    @Published var items: [Activity]
    
    init() {
        self.items = []
    }
}
