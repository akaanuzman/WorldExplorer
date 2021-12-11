//
//  ContentView.swift
//  WorldExplorer
//
//  Created by Ahmet Kaan UZMAN on 11.12.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var fahrenheitValue: String = ""

    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()

    var body: some View {
        VStack {
            TextField("Enter fahreint", text: $fahrenheitValue).font(Font.system(size: 32.0)).multilineTextAlignment(.center).keyboardType(.decimalPad)
            Text("fahrenheit")
            Text("is actually").foregroundColor(.gray)
            Text(convertToCelcius()).font(Font.system(size: 32.0))
            Text("degrees Celcius")
            Spacer()
        }.font(.title).foregroundColor(.blue).padding()
    }

    func convertToCelcius() -> String {
        if let value = Double(fahrenheitValue) {
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)

            let celsiusValue = fahrenheit.converted(to: .celsius)

            return numberFormatter.string(from: NSNumber(value: celsiusValue.value)) ?? "Please enter fahreheit"
        } else {
            return "Please enter fahreheit"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}