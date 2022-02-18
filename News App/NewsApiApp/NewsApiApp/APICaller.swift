//
//  Response.swift
//  NewsApiApp
//
//  Created by Samim Hakimi on 2/17/22.
//

import Foundation

/// reponsbale for
struct APICaller {
    static let shared = APICaller() // singalton
    
    struct Constants {
        static let topHeadlineURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=064b8b7c6e8b4be9a0f85453d2d4a119")
        static let searchUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=064b8b7c6e8b4be9a0f85453d2d4a119&q="
    }
    private init(){}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        guard let url = Constants.topHeadlineURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    //print("Articles: \(result.articles)")
                    completion(.success(result.articles))
                    
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func searchNews(with query: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlString = Constants.searchUrl + query
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    //print("Articles: \(result.articles)")
                    completion(.success(result.articles))
                    
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
                                        
                                        
}


// creating models
struct APIResponse: Codable {
    let articles: [Article]
}
struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}
struct Source : Codable {
    let name: String?
}


