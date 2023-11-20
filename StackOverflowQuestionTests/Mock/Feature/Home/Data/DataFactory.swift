//
//  DataFactory.swift
//  StackOverflowQuestionTests
//
//  Created by Agung Dwi Saputra on 20/11/23.
//

import Foundation
@testable import StackOverflowQuestion

class DataFactor {
    
    
    
    func getFakeQuestion() -> QuestionListResponse {
        let fakeOwner = Owner(
            accountID: 1,
            reputation: 100,
            userID: 1,
            userType: "",
            acceptRate: 1,
            profileImage: "tes",
            displayName: "tes",
            link: "tes"
        )
        let fakeQuestion = QuestionData(
            tags: ["uikit"],
            owner: fakeOwner,
            isAnswered: true,
            viewCount: 1,
            answerCount: 1,
            score: 1,
            lastActivityDate: 1,
            creationDate: 1,
            lastEditDate: 1,
            questionID: 1,
            link: "tes",
            title: "tes",
            bodyMarkdown: "tes"
        )
        return QuestionListResponse(items: [fakeQuestion])
    }
    
}
