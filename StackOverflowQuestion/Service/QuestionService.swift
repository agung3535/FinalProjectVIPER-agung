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
    func getListQuestion() -> Single<QuestionListResponse>
    func getDetailQuestion(id: Int) -> Observable<QuestionListResponse>
}

class QuestionService: QuestionServiceProtocol {
    
    private let provider = MoyaProvider<ApiService>()
    
    private let disposeBag = DisposeBag()
    
    func getListQuestion() -> Single<QuestionListResponse> {
        return provider
            .rx
            .request(.listQuestion(pageSize: 10, sortBy: "votes", orderBy: "desc", tag: "uikit", site: "stackoverflow"))
            .flatMap { response in
                guard (200..<300).contains(response.statusCode) else {
                    throw MoyaError.statusCode(response)
                }
                return .just(response)
            }
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
