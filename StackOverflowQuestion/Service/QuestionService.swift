//
//  QuestionService.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import Foundation
import RxSwift
import Moya


protocol QuestionServiceProtocol {
    func getListQuestion() -> Observable<QuestionListResponse>
    func getDetailQuestion(id: Int) -> Observable<QuestionListResponse>
}

class QuestionService: QuestionServiceProtocol {
    
    private let provider = MoyaProvider<ApiService>()
    
    private let disposeBag = DisposeBag()
    
    func getListQuestion() -> Observable<QuestionListResponse> {
//        provider.request(.listQuestion(pageSize: 10, sortBy: "votes", orderBy: "desc", tag: "uikit", site: "stackoverflow")) { result in
//            switch result {
//
//            case .success(let success):
//                print("success = \(success.request?.url)")
//            case .failure(let error):
//                print("Error request biasa = \(error)")
//            }
//        }
        return provider
            .rx
            .requestWithProgress(.listQuestion(pageSize: 10, sortBy: "votes", orderBy: "desc", tag: "uikit", site: "stackoverflow"))
            .filterCompleted()
            .map(QuestionListResponse.self)
    }
    
    func getDetailQuestion(id: Int) -> Observable<QuestionListResponse> {
        return provider
            .rx
            .requestWithProgress(.detailQuestion(id))
            .filterCompleted()
            .map(QuestionListResponse.self)
    }
    
    
}
