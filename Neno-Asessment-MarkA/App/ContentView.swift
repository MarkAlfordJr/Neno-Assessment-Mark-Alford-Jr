//
//  ContentView.swift
//  Neno-Asessment-MarkA
//
//  Created by Mark Alford on 3/15/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
