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
    
    private let loadingBar: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .black
        view.hidesWhenStopped = true
        return view
    }()
    
    private let errorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let errorLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 16)
        lbl.text = "Test"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let btnRefresh: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Refresh", for: .normal)
        btn.isUserInteractionEnabled = true
        btn.backgroundColor = .systemBlue
        let padding = 10.0
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        return btn
    }()
    
    var homePresenter: HomePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraint()
        uitableView.delegate = self
        uitableView.dataSource = self
        homePresenter.getQuestionList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        btnRefresh.layer.cornerRadius = 5
        let titleSize = btnRefresh.titleLabel?.sizeThatFits(btnRefresh.frame.size)
        btnWidthConstraint.constant = CGFloat((titleSize?.width ?? 0) + 2 * 10)
   
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(uitableView)
        view.addSubview(loadingBar)
        view.addSubview(errorView)
        errorView.addSubview(errorLbl)
        errorView.addSubview(btnRefresh)
        errorView.isHidden = true
        btnRefresh.addTarget(self, action: #selector(refreshBtnAction(sender:)), for: .touchUpInside)
        
        title = "Top Questions"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private var btnWidthConstraint: NSLayoutConstraint!
    private func setupConstraint() {
        btnWidthConstraint = btnRefresh.widthAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            uitableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uitableView.topAnchor.constraint(equalTo: view.topAnchor),
            uitableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uitableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadingBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView.topAnchor.constraint(equalTo: view.topAnchor),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            errorLbl.leadingAnchor.constraint(equalTo: errorView.leadingAnchor),
            errorLbl.trailingAnchor.constraint(equalTo: errorView.trailingAnchor),
            errorLbl.centerYAnchor.constraint(equalTo: errorView.centerYAnchor),
            
            btnWidthConstraint,
            
            btnRefresh.topAnchor.constraint(equalTo: errorLbl.bottomAnchor, constant: 10),
            btnRefresh.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            btnRefresh.bottomAnchor.constraint(lessThanOrEqualTo: errorView.bottomAnchor, constant: -20),
            
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
    
    func showLoading() {
        self.loadingBar.startAnimating()
        self.loadingBar.isHidden = false
    }
    
    func hideLoading() {
        self.loadingBar.stopAnimating()
    }
    
    func showError(error: String) {
        //do nothing
        errorView.isHidden = false
    }
    
    func hideError() {
        // do nothing
        errorView.isHidden = true
    }
    
}

extension HomeViewController {
    
    @objc func refreshBtnAction(sender: Any) {
        homePresenter.refreshData()
    }
    
}
