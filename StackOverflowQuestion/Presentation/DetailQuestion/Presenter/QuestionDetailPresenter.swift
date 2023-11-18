//
//  QuestionDetailPresenter.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import Foundation


protocol QuestionDetailPresenterProtocol: AnyObject {
    
    var questionSection: [QuestionSection] { get }
    func getQuestion() -> QuestionData
    func getUserData() -> Owner

}

class QuestionDetailPresenter: QuestionDetailPresenterProtocol {
    
    private var questionData: QuestionData {
        return interactor.detailQuestion
    }
    private var interactor: QuestionDetailInteractorProtocol
    
    init(interactor: QuestionDetailInteractorProtocol) {
        self.interactor = interactor
    }
    
    var questionSection: [QuestionSection] = [
        QuestionSection(questionSection: .question),
        QuestionSection(questionSection: .questionDetail),
        QuestionSection(questionSection: .userInfo)
    ]
    
    
    func getQuestion() -> QuestionData {
        return questionData
    }
    
    func getUserData() -> Owner {
        return questionData.owner
    }
}
