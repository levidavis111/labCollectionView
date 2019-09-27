//
//  CountryAPIClient.swift
//  lab-collection-view
//
//  Created by Levi Davis on 9/26/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct CountryAPIClient {
    static let manager = CountryAPIClient()
    
//    static func getCountryImageURLString(from url: String) -> String {
//        var path: String = Bundle.main.path(forResource: "\(url)", ofType: "svg")!
//
//        var url: NSURL = NSURL.fileURL(withPath: path) as NSURL  //Creating a URL which points towards our path
//
//        //Creating a page request which will load our URL (Which points to our path)
//        var request: NSURLRequest = NSURLRequest(url: url as URL)
//        webView.loadRequest(request)  //Telling our webView to load our above request
//
//                return "http://images-of-elements.com/\(name.lowercased()).jpg"
//            }
    
    func getCountries(completionHandler: @escaping (Result<[Country], AppError>) -> () ) {
        NetworkManager.manager.performDataTask(withUrl: countryURL, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let countriesInfo = try Country.decodeElementsFromData(from: data)
                    completionHandler(.success(countriesInfo))
                } catch {
                    completionHandler(.failure(.other(rawError: error)))
                }
            }
        }
    }
    
    private var countryURL: URL {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/name/united") else {fatalError("Error: Invalid URL")}
        return url
    }
    
    
    
    private init() {}
}



//struct ElementAPIClient {
//    
//    // MARK: - Static Properties
//    
//    static let manager = ElementAPIClient()
//    
//    // MARK: - Instance Methods
//    
//    static func getElementLargeImageURLString(from name: String) -> String {
//        return "http://images-of-elements.com/\(name.lowercased()).jpg"
//    }
//    
//    func getElements(completionHandler: @escaping (Result<[Element], AppError>) -> ())  {
//        NetworkHelper.manager.performDataTask(withUrl: elementURL, andMethod: .get) { (results) in
//            switch results {
//            case .failure(let error):
//                completionHandler(.failure(error))
//            case .success(let data):
//                do {
//                    let elementInfo = try Element.decodeElementsFromData(from: data)
//                    completionHandler(.success(elementInfo))
//                }
//                catch {
//                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//                }
//                
//            }
//        }
//    }
//    
//    
//    // MARK: - Private Properties and Initializers
//    private var elementURL: URL {
//        guard let url = URL(string: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements") else {
//            fatalError("Error: Invalid URL")
//        }
//        return url
//    }
//    
//    private init() {}
//}

//var path: String = NSBundle.mainBundle().pathForResource("nameOfFile", ofType: "svg")!
//
//var url: NSURL = NSURL.fileURLWithPath(path)  //Creating a URL which points towards our path
//
////Creating a page request which will load our URL (Which points to our path)
//var request: NSURLRequest = NSURLRequest(URL: url)
//webView.loadRequest(request)  //Telling our webView to load our above request
