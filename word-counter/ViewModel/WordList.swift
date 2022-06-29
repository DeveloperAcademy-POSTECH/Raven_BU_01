//
//  WordList.swift
//  word-counter
//
//  Created by apple developer academy on 2022/06/29.
//

import Foundation

class WordList: ObservableObject {
    @Published var words: [String] = []
    init(count: Int) {
        
    }
}
