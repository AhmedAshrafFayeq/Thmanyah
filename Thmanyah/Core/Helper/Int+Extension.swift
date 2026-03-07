//
//  Int+Extension.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

extension Int {
    var formattedDuration: String {
        let totalMinutes = self / 60

        if totalMinutes < 60 {
            return "\(totalMinutes)m"
        }

        let totalHours = totalMinutes / 60
        let remainingMinutes = totalMinutes % 60

        if totalHours < 24 {
            if remainingMinutes == 0 {
                return "\(totalHours)h"
            }
            return "\(totalHours)h \(remainingMinutes)m"
        }

        let days = totalHours / 24
        let remainingHours = totalHours % 24

        if remainingHours == 0 {
            return "\(days)d"
        }

        return "\(days)d \(remainingHours)h"
    }
}
