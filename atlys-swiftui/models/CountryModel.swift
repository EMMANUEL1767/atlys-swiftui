//
//  CountryModel.swift
//  atlys-swiftui
//
//  Created by Emmanuel Biju on 30/11/24.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let code: String
    let flag: String
}

let countries: [Country] = [
    Country(name: "United States", code: "+1", flag: "🇺🇸"),
    Country(name: "India", code: "+91", flag: "🇮🇳"),
    Country(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    Country(name: "Canada", code: "+1", flag: "🇨🇦"),
    Country(name: "Australia", code: "+61", flag: "🇦🇺")
]
