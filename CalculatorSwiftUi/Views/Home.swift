//
//  Home.swift
//  CalculatorSwiftUi
//
//  Created by Alamgir Hossain on 24/10/24.
//

import SwiftUI

struct Home: View {
    
    @State var displayValue = "0"
    @State var runningNumber: Double = 0
    @State var currentOperation: CalcButton? = .none
    
    var space: CGFloat = 12
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(displayValue)
                        .bold()
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                }
                .padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: space) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTapButton(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item) / 2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (5*space)) / 4) * 2 + space
        }
        return (UIScreen.main.bounds.width - (5*space)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*space)) / 4
    }
    
    func didTapButton(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide:
            self.currentOperation = button
            self.runningNumber = Double(self.displayValue) ?? 0
            self.displayValue = "0"
            
        case .equal:
            let currentValue = Double(self.displayValue) ?? 0
            var result: Double = 0
            
            switch self.currentOperation {
            case .add: result = self.runningNumber + currentValue
            case .subtract: result = self.runningNumber - currentValue
            case .multiply: result = self.runningNumber * currentValue
            case .divide:
                if currentValue != 0 {
                    result = self.runningNumber / currentValue
                } else {
                    self.displayValue = "Infinity"
                    return
                }
            default:
                break
            }
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                self.displayValue = "\(Int(result))"
            } else {
                self.displayValue = "\(result)"
            }
            self.currentOperation = nil
            
        case .clear:
            self.displayValue = "0"
            self.runningNumber = 0
            self.currentOperation = nil
            
        case .decimal:
            if !self.displayValue.contains(".") {
                self.displayValue += "."
            }
            
        case .negative:
            if let value = Double(self.displayValue) {
                let negatedValue = value * -1
                if negatedValue.truncatingRemainder(dividingBy: 1) == 0 {
                    self.displayValue = "\(Int(negatedValue))"
                } else {
                    self.displayValue = "\(negatedValue)"
                }
            }

            
        case .percent:
            if let value = Double(self.displayValue) {
                self.displayValue = "\(value / 100)"
            }
            
        default:
            let number = button.rawValue
            if self.displayValue == "0" {
                displayValue = number
            } else {
                self.displayValue += number
            }
        }
    }
}

#Preview {
    Home()
}
