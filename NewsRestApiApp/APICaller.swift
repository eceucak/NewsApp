//
//  APICaller.swift
//  NewsRestApiApp
//
//  Created by Ece Ucak  on 16.11.2021.
//
//adc5189d073341248998e6218504be3f

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    struct Constans{
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=adc5189d073341248998e6218504be3f")
        static let searchUrl = "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=adc5189d073341248998e6218504be3fq="
    }
    
    private init (){}
    
    public func getAllNews(completion: @escaping (Result<[Article], Error >) -> Void){
        guard let url = Constans.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data , _ , error  in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data )
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func searching (with query: String , completion: @escaping (Result<[Article], Error >) -> Void){
        
        
        guard let url = Constans.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data , _ , error  in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data )
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}
