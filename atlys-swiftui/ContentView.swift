//
//  ContentView.swift
//  atlys-swiftui
//
//  Created by Emmanuel Biju on 30/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCountry: Country = countries[0]
    @State private var phoneNumber: String = ""
    @State private var activeID: UUID?
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            logo
            carousalArea
            titleText
            loginArea
            termsAndPrivacyAgreement
        }
        .padding()
    }
    
    var logo: some View {
        VStack(alignment: .center, spacing: .zero) {
            Image("atlys_logo")
                .resizable()
                .scaledToFit()
                .frame(height: 48, alignment: .center)
            Text("visas on time")
                .font(.caption)
                .bold()
                .foregroundColor(.indigo)
        }
    }
    
    var carousalArea: some View {
        CustomCarousalView(data: carousalItems, selection: $activeID) { data in
            ZStack(alignment: .bottom) {
                Image(data.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack(spacing: 4) {
                    Text(data.countryName)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("\(data.visaCount) Visas on Atlys")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(2)
                        .frame(maxWidth: .infinity, alignment:.center)
                        .background(Color.blue)
                }
            }
        }
        .frame(height: 180)
        .onAppear {
            let midIndex = Int(carousalItems.count / 2)
            activeID = carousalItems[midIndex].id
        }
    }
    
    var titleText: some View {
        Text("Get Visas\nOn Time")
            .font(.largeTitle)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
            .lineSpacing(0)
    }
    
    var loginArea: some View {
        VStack(alignment: .center, spacing: 12) {
            PhoneNumberTextField(selectedCountry: $selectedCountry, phoneNumber: $phoneNumber)
            Button(action: {
                print("Phone number captured!!")
            }, label: {
                Text("Continue")
                    .foregroundColor(.white)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.indigo.opacity(phoneNumber.count > 9 ? 1 : 0.5))
                    .cornerRadius(12.0)
            })
            
            HStack(spacing: 8) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                Text("or")
                    .bold()
                    .foregroundColor(.black)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
            
            HStack(spacing: 20) {
                loginMethod(icon: "google") {
                    print("Google sign-in initiated")
                }
                
                loginMethod(icon: "mac-os") {
                    print("Apple sign-in initiated")
                }
                
                loginMethod(icon: "email") {
                    print("Email sign-in initiated")
                }
            }
        }
    }
    
    func loginMethod(icon: String, action: @escaping (() -> Void)) -> some View {
        Button(action: action, label: {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(height: icon == "google" ? 48 : 36)
                .padding(icon == "google" ? 4 : 10)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding(16)
        })
    }
    
    var termsAndPrivacyAgreement: some View {
        VStack(spacing: 4) {
            Text("By continuing you agree to our")
                .foregroundColor(.primary)
            HStack(spacing: 4) {
                Text("Terms")
                    .foregroundColor(.blue)
                    .bold()
                    .underline()
                    .onTapGesture {
                        // Handle tap for terms
                        print("Terms clicked")
                    }
                Text(" & ")
                Text("Privacy Policy")
                    .foregroundColor(.blue)
                    .bold()
                    .underline()
                    .onTapGesture {
                        // Handle tap for privacy
                        print("Privacy clicked")
                    }
            }
        }
    }
    
}

#Preview {
    ContentView()
}

