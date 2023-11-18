//
//  DetailQuestionRouter.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import UIKit

class DetailQuestionRouter {
    
    
    func create(data: QuestionData) -> UIViewController {
        let vc = DetailQuestionViewController()
        vc.title = "Question"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.presenter = createPresenter(data: data)
        return vc
    }
    
    func createPresenter(data: QuestionData) -> QuestionDetailPresenter {
        let interactor = QuestionDetailInteractor(detailQuestion: data)
        return QuestionDetailPresenter(interactor: interactor)
    }
    
}
