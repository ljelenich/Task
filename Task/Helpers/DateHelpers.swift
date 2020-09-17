//
//  DateHelpers.swift
//  Task
//
//  Created by LAURA JELENICH on 9/17/20.
//  Copyright © 2020 LAURA JELENICH. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
