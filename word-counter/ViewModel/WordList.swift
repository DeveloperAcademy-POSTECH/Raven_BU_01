//
//  WordList.swift
//  word-counter
//
//  Created by apple developer academy on 2022/06/29.
//

import Foundation
import SwiftUI

class WordList: ObservableObject {
    @Published var words: [String] = []
    
    
    func getWordList(count: Binding<String>) {
        do {
            words = try Fetch().dataRequest(count: count) ?? []
        } catch {
            print(error)
        }
    }
}

