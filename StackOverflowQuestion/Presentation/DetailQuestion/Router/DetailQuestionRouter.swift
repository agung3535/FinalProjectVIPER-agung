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
        vc.questionData = data
        vc.title = "Question"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        return vc
    }
    
}
