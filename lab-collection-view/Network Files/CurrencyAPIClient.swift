//
//  CurrencyAPIClient.swift
//  lab-collection-view
//
//  Created by Levi Davis on 9/26/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct CurrencyAPIClient {
    static let manager = CurrencyAPIClient()
    
    func getCurrency(completionHandler: @escaping (Result<Currency, AppError>) -> () ) {
        NetworkManager.manager.performDataTask(withUrl: currencyURL, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let currencyInfo = try Currency.decodeElementsFromData(from: data)
                    completionHandler(.success(currencyInfo))
                } catch {
                    completionHandler(.failure(.other(rawError: error)))
                }
            }
        }
    }
    
    private var currencyURL: URL {
        guard let url = URL(string: "http://data.fixer.io/api/latest?access_key=a17aef5ece92cf36d9c5963f7f4babf1&format=1") else {fatalError("Error: Invalid URL")}
        return url
    }
    
    
    
    private init() {}
}
