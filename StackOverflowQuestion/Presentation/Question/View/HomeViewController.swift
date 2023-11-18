//
//  HomeViewController.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let uitableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.identifier)
        view.clipsToBounds = true
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = UITableView.automaticDimension
        return view
    }()
    
    var homePresenter: HomePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(uitableView)
        title = "Top Questions"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupConstraint()
        uitableView.delegate = self
        uitableView.dataSource = self
        homePresenter.getQuestionList()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            uitableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uitableView.topAnchor.constraint(equalTo: view.topAnchor),
            uitableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uitableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePresenter.numberOfQuestion()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        cell.setupData(data: homePresenter.question(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        homePresenter.showDetailQuestion(data: homePresenter.question(at: indexPath.row))
        
    }
}

extension HomeViewController: HomeView {
    
    func reloadView() {
        uitableView.reloadData()
    }
    
    
}
