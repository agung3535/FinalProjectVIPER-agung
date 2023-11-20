//
//  HomeRouter.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import UIKit
import Moya

class HomeRouter {
    
    private var view: UIViewController!
    
    func create() -> UIViewController {
        let vc = HomeViewController()
        let presenter = createHomePresenter(view: vc)
        vc.homePresenter = presenter
        self.view = vc
        return vc
    }
    
    func goToDetailQuestion(data: QuestionData) {
        let vc = DetailQuestionRouter().create(data: data)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createHomePresenter(view: HomeView) -> HomePresenter {
        let presenter = HomePresenter(
            questionInteractor: createQuestionInteractor(service: createQuestionService()),
            homeView: view,
            homeRouter: self
        )
       
        return presenter
    }
    
    private func createQuestionService() -> QuestionServiceProtocol {
        let provider = MoyaProvider<ApiService>()
        let service = QuestionService(provider: provider)
        return service
    }
    
    private func createQuestionInteractor(service: QuestionServiceProtocol) -> QuestionInteractorProtocol {
        let interactor = QuestionInteractor(service: service)
        return interactor
    }
    
}
