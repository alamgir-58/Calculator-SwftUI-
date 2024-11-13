//
//  FrontView.swift
//  CalculatorSwiftUi
//
//  Created by Alamgir Hossain on 27/10/24.
//

import SwiftUI

struct FrontView: View {
    var body: some View {
     NavigationStack {
         VStack {
             HStack {
                 Spacer()
                 NavigationLink(destination: SecondView()) {
                     Text("Right")
                         .padding()
                         .font(.subheadline)
                         .background(Color.blue)
                         .foregroundStyle(.black)
                         .cornerRadius(8)
                         .opacity(0.8)
                         .contrast(01)
                 }
             }
             .padding()
             Spacer()
             
             Text("Front View")
                 .padding()
                 .font(.subheadline)
                 .background(Color.blue)
                 .foregroundStyle(.black)
                 .cornerRadius(8)
             Spacer()
             HStack {
                 NavigationLink(destination: Home()) {
                     Text("Calculator")
                         .padding()
                         .font(.subheadline)
                         .background(Color.blue)
                         .foregroundStyle(.black)
                         .cornerRadius(8)
                 }
                 Text("Contacts")
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
    FrontView()
}
