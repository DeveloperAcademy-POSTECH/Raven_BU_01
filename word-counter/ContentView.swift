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
        Form {
            TextField("단어 입력 갯수", text: $count)
            
            Section("단어") {
//                List {
//                    ForEach
//                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
