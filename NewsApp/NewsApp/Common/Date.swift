//
//  DateConverter.swift
//  NewsApp
//
//  Created by MAYU on 30/12/23.
//

import Foundation

class DateConverter {
    static func convertDateString(_ inputDate: String, defaultValue: String = "Invalid Date") -> String {
        let inputFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let outputFormat = "dd MMM yyyy"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = inputFormat
        
        if let date = dateFormatter.date(from: inputDate) {
            dateFormatter.dateFormat = outputFormat
            return dateFormatter.string(from: date)
        } else {
            return defaultValue
        }
    }
}
