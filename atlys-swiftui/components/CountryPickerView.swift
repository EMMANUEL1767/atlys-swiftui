//
//  CountryPicker.swift
//  atlys-swiftui
//
//  Created by Emmanuel Biju on 30/11/24.
//

import SwiftUI

struct CountryPickerView: View {
    @Binding var selectedCountry: Country
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List(countries) { country in
                HStack(spacing: 4) {
                    Text(country.flag)
                    Text("\(country.name) (\(country.code))")
                }
                .onTapGesture {
                    selectedCountry = country
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Select Country")
        }
    }
}


#Preview {
    CountryPickerView(selectedCountry: .constant(countries[0]))
}
