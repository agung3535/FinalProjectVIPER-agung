//
//  MockHomeView.swift
//  StackOverflowQuestionTests
//
//  Created by Agung Dwi Saputra on 19/11/23.
//

import Foundation

@testable import StackOverflowQuestion

class MockHomeView: HomeView {
    
    var reloadViewCalled = false
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showErrorCalled = false
    var hideErrorCalled = false

    func reloadView() {
        reloadViewCalled = true
    }

    func showLoading() {
        showLoadingCalled = true
    }

    func hideLoading() {
        hideLoadingCalled = true
    }

    func showError(error: String) {
        showErrorCalled = true
    }

    func hideError() {
        hideErrorCalled = true
    }
    
    
}
