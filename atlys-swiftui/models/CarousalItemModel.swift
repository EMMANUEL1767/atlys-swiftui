//
//  CarousalItemModel.swift
//  atlys-swiftui
//
//  Created by Emmanuel Biju on 30/11/24.
//

import Foundation

struct CarousalItemModel: Identifiable, Hashable {
    let id = UUID()
    let countryName: String
    let visaCount: String
    let image: String
}

let carousalItems = [
    CarousalItemModel(countryName: "India", visaCount: "12K+", image: "india"),
    CarousalItemModel(countryName: "Malaysia", visaCount: "14K+", image: "malaysia"),
    CarousalItemModel(countryName: "Qatar", visaCount: "20K+", image: "qatar"),
    CarousalItemModel(countryName: "Dubai", visaCount: "15K+", image: "dubai"),
]
