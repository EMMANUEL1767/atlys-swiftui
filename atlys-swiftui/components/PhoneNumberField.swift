//
//  PhoneNumberField.swift
//  atlys-swiftui
//
//  Created by Emmanuel Biju on 30/11/24.
//

import SwiftUI

struct PhoneNumberTextField: View {
    @Binding var selectedCountry: Country
    @Binding var phoneNumber: String
    @State private var isCountryPickerPresented: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    isCountryPickerPresented.toggle()
                }) {
                    HStack(spacing: 4) {
                        Text(selectedCountry.flag)
                            .font(.largeTitle)
                        Text(selectedCountry.code)
                            .foregroundColor(.primary)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(width: 8, alignment: .center)
                        

                    }
                    .padding(.leading, 10)
                }
                .sheet(isPresented: $isCountryPickerPresented) {
                    CountryPickerView(selectedCountry: $selectedCountry)
                }
                
                Divider()
                    .frame(height: 30)
                    .padding(.horizontal, 6)
                
                TextField("Enter mobile number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .autocapitalization(.none)
                    .padding(.vertical, 10)
                
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
        }
    }
}

