//
//  ContentView.swift
//  TimeConversion
//
//  Created by deniz on 3.01.2024.
//

import SwiftUI

enum Units: String, CaseIterable {
    case seconds
    case minutes
    case hours
    case days
}

struct ContentView: View {
    @State private var inputUnitId = Units.seconds
    @State private var outputUnitId = Units.seconds
    @State private var inputTime = 0.0
    
    var secondFormOfTime: Double {
        switch inputUnitId {
        case .seconds:
            return inputTime
        case .minutes:
            return inputTime * 60
        case .hours:
            return inputTime * 3600
        case .days:
            return inputTime * 86400
        }
    }
    
    var resultOfConversion: Double {
        switch outputUnitId {
        case .seconds:
            return secondFormOfTime
        case .minutes:
            return secondFormOfTime / 60
        case .hours:
            return secondFormOfTime / 3600
        case .days:
            return secondFormOfTime / 86400
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Time conversion from") {
                    Picker("Which unit do you want to conversion from?", selection: $inputUnitId) {
                        ForEach(Units.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Time conversion to") {
                    Picker("Which unit do you want to conversion into?", selection: $outputUnitId) {
                        ForEach(Units.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("input") {
                    TextField("Time", value: $inputTime, format: .number)
                }
                
                Section("output") {
                    Text(resultOfConversion, format: .number)
                }
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
