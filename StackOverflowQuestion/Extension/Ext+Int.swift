//
//  Ext+Int.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import Foundation


extension Int {
    
    func secondToStringDate(format: String) -> String? {
        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    func formatNumberWithThousandSeparator(_ number: Double) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2

        return numberFormatter.string(from: NSNumber(value: number))
    }
    
    func formatNumberThousand() -> String {
        var result = ""
        var count = 0
        var numberStr = String(self).reversed()
        for i in numberStr {
          count += 1
          if count > 3 {
             result.append(".")
             result.append(i)
             count = 0
          }else {
            result.append(i)
          }
        }
        return String(result.reversed())
    }
    
}
