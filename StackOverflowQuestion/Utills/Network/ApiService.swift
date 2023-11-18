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
    case detailQuestion(Int)
}

extension ApiService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.stackexchange.com/2.3")!
    }
    
    var path: String {
        switch self {
            
        case .listQuestion:
            return "/questions"
        case .detailQuestion(id: let id):
            return "/question/\(id)?site=stackoverflow"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .listQuestion, .detailQuestion:
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
        case .detailQuestion:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
