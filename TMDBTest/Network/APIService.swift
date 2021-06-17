//
//  APIService.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import Foundation

protocol APIServiceProtocol {
    func fetchMovies(completion: @escaping (Result<Movies, Error>) -> ())
}

class APIService: APIServiceProtocol {
    
    private let apiKey = "6e3a4363bc5fa7a184e0a3cde01167c2"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let popular = "popular"  //popular
    
    
    
    func fetchMovies(completion: @escaping (Result<Movies, Error>) -> ()) {
        guard let url = URL(string: "\(baseAPIURL)/movie/\(popular)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -100001, userInfo: nil)))
            return
        }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -100001, userInfo: nil)))
            return
        }
        
        let apiQueryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = apiQueryItems
        
        guard let requestURL = urlComponents.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: -100001, userInfo: nil)))
            return
        }
        
        fetcher(requestURL, completion)
    }
    
    
    private func fetcher(_ requestURL: URL, _ completion: @escaping (Result<Movies, Error>) -> ()) {
        urlSession.dataTask(with: requestURL) { data, responce, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "dataNilError", code: -100001, userInfo: nil)) )
                return
            }
            //print(String(data: data, encoding: .utf8))
            
            do {
                let decoder = JSONDecoder()
                completion(.success(try decoder.decode(Movies.self, from: data)))
                return
            } catch {
                print(error.localizedDescription)
                completion(.failure(NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
                return
            }
        }
        .resume()
    }
}
