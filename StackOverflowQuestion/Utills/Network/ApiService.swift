//
//  ApiService.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 16/11/23.
//

import Foundation
import Moya

enum ApiService {
    case listQuestion(pageSize:Int,sortBy:String,orderBy:String,tag:String,site:String)
}

extension ApiService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.stackexchange.com/2.3")!
    }
    
    var path: String {
        switch self {
            
        case .listQuestion:
            return "/questions"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .listQuestion:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .listQuestion(let pageSize, let sortBy, let orderBy, let tag, let site):
            return .requestParameters(parameters: [
                "pagesize":pageSize,
                "sort":sortBy,
                "order":orderBy,
                "tagged":tag,
                "site":site,
                "filter":"!nNPvSNP4(R"
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
