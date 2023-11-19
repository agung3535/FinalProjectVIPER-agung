//
//  HomePresenter.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import UIKit
import RxSwift


protocol HomePresenterProtocol {
    func getQuestionList()
    func numberOfQuestion() -> Int
    func question(at index: Int) -> QuestionData
    func refreshData()
}

class HomePresenter: HomePresenterProtocol {
    
    private weak var homeView: HomeView?
    
    private var questionInteractor: QuestionInteractorProtocol
    
    private var homeRouter: HomeRouter
    
    private var disposeBag = DisposeBag()
    
    private var questionList: [QuestionData] = []
    
    init(questionInteractor: QuestionInteractorProtocol,
         homeView: HomeView,
         homeRouter: HomeRouter
    ) {
        self.questionInteractor = questionInteractor
        self.homeView = homeView
        self.homeRouter = homeRouter
    }
    
    func getQuestionList() {
        homeView?.showLoading()
        questionInteractor.getListQuestion()
            .subscribe(onSuccess: { [weak self] result in
                self?.homeView?.hideLoading()
                self?.homeView?.hideError()
                guard let self = self else {
                    return
                }
                self.questionList = result.items
                self.homeView?.reloadView()
            }, onFailure: { [weak self] error in
                guard let self = self else {
                    return
                }
                self.homeView?.hideLoading()
                self.homeView?.showError(error: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    func numberOfQuestion() -> Int {
        return questionList.count
    }
    
    func question(at index: Int) -> QuestionData {
        return questionList[index]
    }
    
    func showDetailQuestion(data quesiton: QuestionData) {
        homeRouter.goToDetailQuestion(data: quesiton)
    }
    
    func refreshData() {
        getQuestionList()
        self.homeView?.hideError()
    }
}
