//
//  HomeView.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import Foundation


protocol HomeView: AnyObject {
    func reloadView()
    func showLoading()
    func hideLoading()
    func showError(error: String)
    func hideError()
}
