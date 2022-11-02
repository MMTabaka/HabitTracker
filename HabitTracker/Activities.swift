//
//  Activities.swift
//  HabitTracker
//
//  Created by Miłosz Tabaka on 01/11/2022.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "UserData")
            }
        }
    }
        
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "UserData") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
