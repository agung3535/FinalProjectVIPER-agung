//
//  QuestionSection.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import Foundation


struct QuestionSection {
    let id: UUID = UUID()
    let questionSection: QuestionSectionType
}


enum QuestionSectionType {
    case question
    case questionDetail
    case userInfo
}
