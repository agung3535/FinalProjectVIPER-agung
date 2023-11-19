//
//  HomePresenterTest.swift
//  StackOverflowQuestionTests
//
//  Created by Agung Dwi Saputra on 19/11/23.
//

import XCTest
@testable import StackOverflowQuestion

final class HomePresenterTest: XCTestCase {

    private var homePresenter: HomePresenterProtocol!
    private var mockInteractor: MockQuestionInteractor!
    private var homeView: MockHomeView!
    private var router: HomeRouter!

    override func setUp() {
        homeView = MockHomeView()
        mockInteractor = MockQuestionInteractor()
        router = HomeRouter()
        homePresenter = HomePresenter(questionInteractor: mockInteractor, homeView: homeView, homeRouter: router)
    }
    
    override func tearDown() {
        homeView = nil
        mockInteractor = nil
        router = nil
    }
    
    
    func test_get_question_list() {
        
        //when
        mockInteractor.itShouldReturnError = false
        homePresenter.getQuestionList()
        
        XCTAssertTrue(homeView.showLoadingCalled)
        XCTAssertTrue(homeView.hideLoadingCalled)
        XCTAssertTrue(homeView.reloadViewCalled)
        
    }
    
    func test_get_question_list_error() {
        
        mockInteractor.itShouldReturnError = true
        homePresenter.getQuestionList()
        
        XCTAssertTrue(homeView.showLoadingCalled)
        XCTAssertTrue(homeView.hideLoadingCalled)
        XCTAssertTrue(homeView.showErrorCalled)
        XCTAssertFalse(homeView.reloadViewCalled)
    }
    
    func test_refresh_data_invoke() {
        mockInteractor.itShouldReturnError = false
        homePresenter.refreshData()
        
        XCTAssertTrue(homeView.showLoadingCalled)
        XCTAssertTrue(homeView.hideLoadingCalled)
        XCTAssertTrue(homeView.reloadViewCalled)
    }

}
