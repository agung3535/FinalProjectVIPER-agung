//
//  HomeInteractorTest.swift
//  StackOverflowQuestionTests
//
//  Created by Agung Dwi Saputra on 19/11/23.
//

import XCTest
import RxSwift
@testable import StackOverflowQuestion

final class QuestionInteractorTest: XCTestCase {

    private var questionInteractor: QuestionInteractorProtocol!
    private var disposeBag: DisposeBag!
    private var questionService: MockQuestionService!
    
    override func setUp() {
        questionService = MockQuestionService()
        questionInteractor = QuestionInteractor(service: questionService)
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        questionInteractor = nil
        disposeBag = nil
    }
    
    
    func test_get_listQuestion_success() {
        
        let result = DataFactor().getFakeQuestion()
        
        //given
        questionService.itShouldReturnError = false
        
        //when
        let observer = questionInteractor.getListQuestion()
        
        
        observer.subscribe(onSuccess: { response in
            XCTAssertNotNil(response)
            XCTAssertEqual(result.items.first?.questionID, response.items.first?.questionID)
        })
        .disposed(by: disposeBag)
        
    }
    
    func test_get_listQuestion_failure() {
        
        let result = DataFactor().getFakeQuestion()
        
        //given
        questionService.itShouldReturnError = true
        
        //when
        let observer = questionInteractor.getListQuestion()
        
        
        observer.subscribe(onFailure: { error in
            XCTAssertNotNil(error)
            
        })
        .disposed(by: disposeBag)
        
    }
    

}
