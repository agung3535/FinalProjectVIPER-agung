//
//  QuestionListResponse.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import Foundation


struct QuestionListResponse: Codable {
    let items: [QuestionData]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent([QuestionData].self, forKey: .items) ?? []
    }
    
}

struct QuestionData: Codable {
    let tags: [String]
    let owner: Owner
    let isAnswered: Bool
    let viewCount: Int
    let protectedDate: Int?
    let acceptedAnswerID, answerCount, score, lastActivityDate: Int
    let creationDate, lastEditDate, questionID: Int
    let contentLicense: String?
    let link: String
    let title: String
    let closedDate: Int?
    let closedReason: String?
    let bodyMarkdown: String?
    
    enum CodingKeys: String, CodingKey {
        case tags,owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case protectedDate = "protected_date"
        case acceptedAnswerID = "accepted_answer_id"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case lastEditDate = "last_edit_date"
        case questionID = "question_id"
        case contentLicense = "content_license"
        case link, title
        case closedDate = "closed_date"
        case closedReason = "closed_reason"
        case bodyMarkdown = "body_markdown"
        
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tags = try container.decodeIfPresent([String].self, forKey: .tags) ?? []
        self.owner = try container.decode(Owner.self, forKey: .owner)
        self.isAnswered = try container.decodeIfPresent(Bool.self, forKey: .isAnswered) ?? false
        self.viewCount = try container.decodeIfPresent(Int.self, forKey: .viewCount) ?? 0
        self.protectedDate = try container.decodeIfPresent(Int.self, forKey: .protectedDate)
        self.acceptedAnswerID = try container.decodeIfPresent(Int.self, forKey: .acceptedAnswerID) ?? 0
        self.answerCount = try container.decodeIfPresent(Int.self, forKey: .answerCount) ?? 0
        self.score = try container.decodeIfPresent(Int.self, forKey: .score) ?? 0
        self.lastActivityDate = try container.decodeIfPresent(Int.self, forKey: .lastActivityDate) ?? 0
        self.creationDate = try container.decodeIfPresent(Int.self, forKey: .creationDate) ?? 0
        self.lastEditDate = try container.decodeIfPresent(Int.self, forKey: .lastEditDate) ?? 0
        self.questionID = try container.decodeIfPresent(Int.self, forKey: .questionID) ?? 0
        self.contentLicense = try container.decodeIfPresent(String.self, forKey: .contentLicense) ?? ""
        self.link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.closedDate = try container.decodeIfPresent(Int.self, forKey: .closedDate) ?? 0
        self.closedReason = try container.decodeIfPresent(String.self, forKey: .closedReason) ?? ""
        self.bodyMarkdown = try container.decodeIfPresent(String.self, forKey: .bodyMarkdown) ?? ""
    }
}

struct Owner: Codable {
    let accountID, reputation, userID: Int
    let userType: String?
    let acceptRate: Int?
    let profileImage: String
    let displayName: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountID = try container.decode(Int.self, forKey: .accountID)
        self.reputation = try container.decode(Int.self, forKey: .reputation)
        self.userID = try container.decode(Int.self, forKey: .userID)
        self.userType = try container.decodeIfPresent(String.self, forKey: .userType)
        self.acceptRate = try container.decodeIfPresent(Int.self, forKey: .acceptRate)
        self.profileImage = try container.decode(String.self, forKey: .profileImage)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.link = try container.decode(String.self, forKey: .link)
    }
}
