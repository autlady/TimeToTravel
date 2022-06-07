//
//  Extensions.swift
//  TimeToTravel
//
//  Created by  Юлия Григорьева on 06.06.2022.
//

import Foundation

extension String {
    func dateFromWebtoApp(_ inDate: String) -> String? {
        let inFormatter = ISO8601DateFormatter()
        if let date = inFormatter.date(from: inDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            dateFormatter.locale = Locale(identifier: "ru_RU_POSIX")
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
