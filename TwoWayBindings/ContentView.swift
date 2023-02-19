//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Astrid Snäll on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    
    var body: some View {
        VStack {
            Group{
                Text("Press count: \(pressCount)")
                
                Button("press me") {
                    pressCount += 1
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                TextField("enter a name", text: $name )
                    .textFieldStyle(.roundedBorder)
                Text("Name entered: \(name)")
                Spacer()
                Rectangle()
                    .fill(selectedColor)
                    .frame(width: 100, height: 100)
                ColorPicker("Pick a rectangle color:", selection: $selectedColor)
                
            }
            
            Toggle("Toggle is \(toggleIsOn ? "on" : "off"):", isOn: $toggleIsOn)
            
            Spacer()
            DatePicker("Date:", selection: $selectedDate)
            Text("selected date is : \(selectedDate.formatted(date: . abbreviated, time: .shortened))")
            Spacer()
            Stepper("stepper value \(stepperValue)", value: $stepperValue , in: 1...10)
        }
        .font((.title2))
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
