//
//  QuestionService.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import Foundation
import RxSwift

protocol QuestionInteractorProtocol {
    func getListQuestion() -> Single<QuestionListResponse>
    func getDetailQuestion(id: Int) -> Observable<QuestionListResponse>
}


class QuestionInteractor: QuestionInteractorProtocol {
    
    private var service: QuestionServiceProtocol
    
    init(service: QuestionServiceProtocol) {
        self.service = service
    }
    
    func getListQuestion() -> Single<QuestionListResponse> {
        return service.getListQuestion()
    }
    
    func getDetailQuestion(id: Int) -> Observable<QuestionListResponse> {
        return service.getDetailQuestion(id: id)
    }
    
}
