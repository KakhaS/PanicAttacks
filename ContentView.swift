//
//  ContentView.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 06.02.21.
//

import UIKit
import SwiftUI

class ContentView: UIView {
    var body: some View{
        TabView {
            Text("First")
                .tabItem {
                    Image(systemName: "person")
                    Text("First")
                }
            Text("second")
                .tabItem {
                    Image(systemName: "gear")
                    Text("second")
                }
        }
    }
}
