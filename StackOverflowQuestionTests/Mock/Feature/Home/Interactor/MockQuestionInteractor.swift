//
//  MockHomeInteractor.swift
//  StackOverflowQuestionTests
//
//  Created by Agung Dwi Saputra on 19/11/23.
//

import Foundation
import RxSwift
import RxTest
import Moya
@testable import StackOverflowQuestion

class MockQuestionInteractor {
    
    var itShouldReturnError = false
    
    let fakeOwner = Owner(
        accountID: 1,
        reputation: 100,
        userID: 1,
        userType: "",
        acceptRate: 1,
        profileImage: "tes",
        displayName: "tes",
        link: "tes"
    )
    
    
    
    
}


extension MockQuestionInteractor: QuestionInteractorProtocol {
    
    
    
    func getListQuestion() -> RxSwift.Single<StackOverflowQuestion.QuestionListResponse> {
        
        let fakeQuestion = QuestionData(
            tags: ["uikit"],
            owner: fakeOwner,
            isAnswered: true,
            viewCount: 1,
            answerCount: 1,
            score: 1,
            lastActivityDate: 1,
            creationDate: 1,
            lastEditDate: 1,
            questionID: 1,
            link: "tes",
            title: "tes",
            bodyMarkdown: "tes"
        )
        
        if itShouldReturnError {
            return Single.create(subscribe: { event in
                event(.failure(MockError.mockedError("error bro")))
                return Disposables.create()
            })
        }else {
            return Single.create(subscribe: { event in
                event(.success(QuestionListResponse(items: [fakeQuestion])))
                return Disposables.create()
            })
        }
    }
    

    func getDetailQuestion(id: Int) -> RxSwift.Observable<StackOverflowQuestion.QuestionListResponse> {
        return Observable.never()
    }
    
    
}

enum MockError: Error {
    case mockedError(String)
}
