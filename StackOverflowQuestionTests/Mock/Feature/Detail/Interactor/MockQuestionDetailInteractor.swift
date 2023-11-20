//
//  MockQuestionDetailInteractor.swift
//  StackOverflowQuestionTests
//
//  Created by Agung Dwi Saputra on 20/11/23.
//

import Foundation
@testable import StackOverflowQuestion

class MockQuestionDetailInteractor {
    
}


extension MockQuestionDetailInteractor: QuestionDetailInteractorProtocol {
    
    var detailQuestion: StackOverflowQuestion.QuestionData {
        return DataFactor().getFakeQuestion().items.first!
    }
    
    
}
