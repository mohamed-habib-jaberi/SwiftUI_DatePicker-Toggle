//
//  ContentView.swift
//  SwiftUI_DatePicker&Toggle
//
//  Created by mohamed  habib on 19/05/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var isActivatingMessage: String {
        return "CatNip is " + (isActivate ? "Activate" :  "Desactivate")
    }
    var dateFormatter: DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }
    
    @State private var isActivate = false
    @State private var pickedDate = Date()
    
    
    var body: some View {
        VStack {
            Toggle("Activate Cat Nip!", isOn: $isActivate )
            
            Text(isActivatingMessage)
                .foregroundColor(isActivate ? .green : .red)
                .fontWeight(isActivate ? .heavy : .regular)
            
            Toggle(isOn: $isActivate){
                VStack{
                    
                    Image("CatNip")
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                    Text("Activate CatNip!")
                    
                }
            }
            
//            DatePicker(selection: $pickedDate, displayedComponents: [.date]) {
//
//                Text("Selected date")
//            }
            DatePicker(selection: $pickedDate, in: ClosedRange(uncheckedBounds: (lower: Date(), upper: Date(timeIntervalSinceNow: 900000))), displayedComponents: .date, label: {
                
                 Text("Selected date")
            })
             Text("\(dateFormatter.string(from: pickedDate))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
