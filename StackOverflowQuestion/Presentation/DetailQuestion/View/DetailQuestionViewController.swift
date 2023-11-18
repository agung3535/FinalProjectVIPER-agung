//
//  DetailQuestionViewController.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import UIKit
import Down
import Kingfisher

class DetailQuestionViewController: UIViewController {
    
    private let mainTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.identifier)
        view.register(QuestionDetailTableViewCell.self, forCellReuseIdentifier: QuestionDetailTableViewCell.identifier)
        view.register(UserInfoTableViewCell.self, forCellReuseIdentifier: UserInfoTableViewCell.identifier)
        view.separatorStyle = .none
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.alwaysBounceVertical = true
        return view
    }()
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private var section = [QuestionSection]()
    
    var presenter: QuestionDetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupConstraint()
        initSection()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        
    }
    
    private func initSection() {
        section.append(QuestionSection(questionSection: .question))
        section.append(QuestionSection(questionSection: .questionDetail))
        section.append(QuestionSection(questionSection: .userInfo))
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            mainTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
    }

}


extension DetailQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.questionSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.questionSection[section].questionSection {
            
        case .question:
            return 1
        case .questionDetail:
            return 1
        case .userInfo:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.questionSection[indexPath.section].questionSection {
            
        case .question:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as? QuestionTableViewCell else {
                return UITableViewCell()
            }
            cell.setupData(data: presenter.getQuestion())
            return cell
        case .questionDetail:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionDetailTableViewCell.identifier, for: indexPath) as? QuestionDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.setupData(data: presenter.getQuestion())
            return cell
        case .userInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.identifier, for: indexPath) as? UserInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setupData(data: presenter.getUserData())
            return cell
        }
    }
    
    
    
}

