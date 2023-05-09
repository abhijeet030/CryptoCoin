//
//  Double.swift
//  CryptoCoin
//
//  Created by Abhijeet Ranjan  on 10/05/23.
//

import Foundation

extension Double {
    private var currencyFormater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFormater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    func convertToPercentage() -> String {
        guard let numberAsString = numberFormater.string(for: self) else {return " "}
        return numberAsString + "%"
    }
    func convertToCurrency() -> String {
        return currencyFormater.string(for: self) ?? "$0.00"
    }
}
