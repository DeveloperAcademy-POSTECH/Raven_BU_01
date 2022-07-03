//
//  ContentView.swift
//  word-counter
//
//  Created by apple developer academy on 2022/06/29.
//

import SwiftUI

struct ContentView: View {
    @State private var count = ""
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ShowWordList()) {
                Text("여기 누르면 detailView로")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
