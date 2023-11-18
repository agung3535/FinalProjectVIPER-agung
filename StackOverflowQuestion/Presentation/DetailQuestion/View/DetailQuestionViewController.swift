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
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let tagLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .systemBlue
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let voteView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setIconImage(UIImage(systemName: "arrowtriangle.up.circle"))
        view.setContentText("0")
        let color = #colorLiteral(red: 0.9977579713, green: 0.1741216779, blue: 0.3346705437, alpha: 1)
        view.setTextColor(color)
        view.setTintColor(color)
        view.setFont(.systemFont(ofSize: 12))
        return view
    }()
    
    private let enggageVoteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
 
    private let commentView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setIconImage(UIImage(systemName: "ellipses.bubble"))
        view.setContentText("0")
        let color = #colorLiteral(red: 0.9977579713, green: 0.1741216779, blue: 0.3346705437, alpha: 1)
        view.setTextColor(color)
        view.setTintColor(color)
        view.setFont(.systemFont(ofSize: 12))
        return view
    }()
    
    private let enggageCommentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let watchView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setIconImage(UIImage(systemName: "eye"))
        view.setContentText("0")
        let color = #colorLiteral(red: 0.9977579713, green: 0.1741216779, blue: 0.3346705437, alpha: 1)
        view.setTextColor(color)
        view.setTintColor(color)
        view.setFont(.systemFont(ofSize: 12))
        return view
    }()
    
    private let enggageWatchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let vStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let enggageStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let questionDetailLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.textAlignment = .justified
        lbl.numberOfLines = 0
        lbl.text = "ini question detail"
        return lbl
    }()
    
    private let userInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userImg: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let userName: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.textAlignment = .justified
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let reputationLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 10)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.textAlignment = .justified
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var questionData: QuestionData!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupConstraint()
        titleLbl.text = questionData.title
        tagLbl.text = questionData.tags.joined(separator: ", ")
        dateLbl.text = "Asked on " + String(questionData.creationDate.secondToStringDate(format: "dd MMMM yyyy 'at' hh:mm") ?? "")
        voteView.setContentText(String(questionData.score))
        commentView.setContentText(String(questionData.answerCount))
        watchView.setContentText(String(questionData.viewCount))
        questionDetailLbl.attributedText = "".attributedStringFromMarkdown(markdownString: questionData.bodyMarkdown ?? "")
        
        userName.text = questionData.owner.displayName
        reputationLbl.text = String(questionData.owner.reputation)
        userImg.kf.setImage(with: URL(string: questionData.owner.profileImage))
        
        view.backgroundColor = .white
    }

    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        mainView.addSubview(vStack)
        mainView.addSubview(enggageStack)
        mainView.addSubview(questionDetailLbl)
        mainView.addSubview(userInfoView)
        
        userInfoView.addSubview(userImg)
        userInfoView.addSubview(userName)
        userInfoView.addSubview(reputationLbl)
        
        vStack.addArrangedSubview(titleLbl)
        vStack.addArrangedSubview(tagLbl)
        vStack.addArrangedSubview(dateLbl)
    
        
        enggageStack.addArrangedSubview(voteView)
        enggageStack.addArrangedSubview(commentView)
        enggageStack.addArrangedSubview(watchView)
        scrollView.delegate = self
        
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            mainView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        
            enggageStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            enggageStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0),
            enggageStack.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 10),
//            enggageStack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        
  
            vStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            vStack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            questionDetailLbl.topAnchor.constraint(equalTo: enggageStack.bottomAnchor, constant: 20),
            questionDetailLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            questionDetailLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            userInfoView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            userInfoView.topAnchor.constraint(equalTo: questionDetailLbl.bottomAnchor, constant: 20),
            
            userImg.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10),
            userImg.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 10),
            userImg.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: -10),
            
            userName.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 10),
            userName.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 10),
            userName.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
            
            reputationLbl.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 10),
            reputationLbl.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            reputationLbl.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
//            reputationLbl.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: -10),
            
            userImg.widthAnchor.constraint(equalToConstant: 40),
            userImg.heightAnchor.constraint(equalToConstant: 40),
        
        ])
    }

}


extension DetailQuestionViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x>0 || scrollView.contentOffset.x < 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
}

