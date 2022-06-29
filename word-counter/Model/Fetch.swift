//
//  fetch.swift
//  word-counter
//
//  Created by apple developer academy on 2022/06/29.
//

import Foundation

// MARK: https://random-word-api.herokuapp.com/word?number=10

struct Word {
    func dataRequest(count:Int) throws -> [String]? {
        var result:[String]?
        
        // MARK: 단어 에러 핸들링
        guard count >= 1 && count <= 15 else {
            throw fatalError("Count Error")
        }
        
        let urlString: String = "https://random-word-api.herokuapp.com/word?number=\(count)"
        let session = URLSession(configuration: .default)
        let urlComponents = URLComponents(string: urlString)
        guard let requestURL =  urlComponents?.url else {
            throw fatalError("urlComponent Error")
        }
        
        let dataTask =  session.dataTask(with: requestURL) { (data, response, error) in
            
            // MARK: Error가 존재하면 종료
            guard error == nil else { return }

            // MARK: Status code 바탕으로 정상 작동 시 패스
            let successsRange = 200..<300
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successsRange.contains(statusCode) else { return }
            

            // MARK: Response 데이터 획득, utf8인코딩을 통해 string형태로 변환
            guard let resultData = data else { return }
            
            result = self.parse(resultData)
            // MARK: data까지는 확실하게 가져오는데.. 왜 값으로 가져오지 못하지 ㅠㅠ
            print(result)
        }
        dataTask.resume()
        
        return result
    }
    
    func parse(_ data: Data) -> [String] {
        do {
           let decoder = JSONDecoder()
            return try decoder.decode([String].self, from: data)
       } catch {
           fatalError("Couldn't parse")
       }
    }
}
