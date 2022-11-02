//
//  Activity.swift
//  HabitTracker
//
//  Created by Miłosz Tabaka on 01/11/2022.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    var counter = 0
}
