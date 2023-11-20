//
//  QuestionDetailPresenter.swift
//  StackOverflowQuestionTests
//
//  Created by Agung Dwi Saputra on 20/11/23.
//

import XCTest
@testable import StackOverflowQuestion

final class QuestionDetailPresenterTest: XCTestCase {

    private var questionPresenter: QuestionDetailPresenterProtocol!
    private var interactor: QuestionDetailInteractorProtocol!
    
    override func setUp() {
        interactor = MockQuestionDetailInteractor()
        questionPresenter = QuestionDetailPresenter(interactor: interactor)
    }
    
    override func tearDown() {
        questionPresenter = nil
        interactor = nil
    }
    
    func test_detail_question_data() {
        
        //when
        let result = questionPresenter.getQuestion()
        
        XCTAssertEqual(DataFactor().getFakeQuestion().items.first?.questionID, result.questionID)
    }
    
    func test_detail_owner_data() {
        
        //when
        let result = questionPresenter.getUserData()
        
        XCTAssertEqual(DataFactor().getFakeQuestion().items.first?.owner.accountID, result.accountID)
    }

}
