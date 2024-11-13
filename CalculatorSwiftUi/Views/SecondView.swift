//
//  SecondView.swift
//  CalculatorSwiftUi
//
//  Created by Alamgir Hossain on 27/10/24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Left")
                        .padding()
                        .font(.subheadline)
                        .background(Color.blue)
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                    Spacer()
                    NavigationLink(destination: Home()) {
                        Text("Right")
                            .padding()
                            .font(.subheadline)
                            .background(Color.blue)
                            .foregroundStyle(.black)
                            .cornerRadius(8)
                    }
                }
                .padding()
                Spacer()
                VStack (spacing: 10){
                    Text("Second View 1")
                        .padding()
                        .font(.subheadline)
                        .background(Color.blue)
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                    Text("Second View 2")
                        .padding()
                        .font(.subheadline)
                        .background(Color.blue)
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                }
                Spacer()
                HStack {
                    Text("One")
                        .padding()
                        .font(.subheadline)
                        .background(Color.blue)
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                    Text("Two")
                        .padding()
                        .font(.subheadline)
                        .background(Color.blue)
                        .foregroundStyle(.black)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    SecondView()
}

//Alamgir
