//
//  UserInfoTableViewCell.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    static let identifier = "UserInfoTableViewCell"
    
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserInfoTableViewCell {
    
    private func setupView() {
        contentView.addSubview(userInfoView)
        userInfoView.addSubview(userImg)
        userInfoView.addSubview(userName)
        userInfoView.addSubview(reputationLbl)
    }
    
    private func setupConstraint() {
        let safeArea = contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            userInfoView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            userInfoView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            userInfoView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
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
    
    func setupData(data: Owner) {
        userImg.kf.setImage(with: URL(string: data.profileImage))
        userName.text = data.displayName
        reputationLbl.text = String(data.reputation)
    }
    
}
