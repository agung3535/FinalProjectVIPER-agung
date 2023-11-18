//
//  DetailInteractor.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import Foundation

protocol QuestionDetailInteractorProtocol {
    
    var detailQuestion: QuestionData { get}
    
}

class QuestionDetailInteractor: QuestionDetailInteractorProtocol {
    internal var detailQuestion: QuestionData
    
    init(detailQuestion: QuestionData) {
        self.detailQuestion = detailQuestion
    }
    
    
}
