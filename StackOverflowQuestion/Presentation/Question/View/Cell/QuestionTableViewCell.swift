//
//  QuestionTableViewCell.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import UIKit
import Kingfisher

class QuestionTableViewCell: UITableViewCell {
    
    static let identifier = "QuestionTableViewCell"
    
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
        lbl.font = .systemFont(ofSize: 12
        )
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let iconArrow: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "chevron.right")
        view.tintColor = .gray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let horStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private let viewArrow: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
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
    
    private func setupView() {
        contentView.addSubview(vStack)
        contentView.addSubview(iconArrow)
        contentView.addSubview(enggageStack)
        
        vStack.addArrangedSubview(titleLbl)
        vStack.addArrangedSubview(tagLbl)
        vStack.addArrangedSubview(dateLbl)
    
        enggageStack.addArrangedSubview(enggageVoteView)
        enggageStack.addArrangedSubview(enggageCommentView)
        enggageStack.addArrangedSubview(enggageWatchView)
        
        enggageVoteView.addSubview(voteView)
        enggageCommentView.addSubview(commentView)
        enggageWatchView.addSubview(watchView)
        
    }
    
    
    private func setupConstraint() {
        let safeArea = contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            vStack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            vStack.bottomAnchor.constraint(equalTo: enggageStack.topAnchor, constant: -15),
            
            enggageStack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            enggageStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            enggageStack.trailingAnchor.constraint(equalTo: iconArrow.leadingAnchor, constant: -10),
            
            iconArrow.leadingAnchor.constraint(equalTo: vStack.trailingAnchor, constant: 10),
            iconArrow.topAnchor.constraint(equalTo: safeArea.topAnchor),
            iconArrow.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            iconArrow.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            iconArrow.widthAnchor.constraint(equalToConstant: 10),

        
            voteView.topAnchor.constraint(equalTo: enggageVoteView.topAnchor),
            voteView.bottomAnchor.constraint(equalTo: enggageVoteView.bottomAnchor),
            voteView.centerYAnchor.constraint(equalTo: enggageVoteView.centerYAnchor),
            
            commentView.topAnchor.constraint(equalTo: enggageCommentView.topAnchor),
            commentView.bottomAnchor.constraint(equalTo: enggageCommentView.bottomAnchor),
            commentView.centerYAnchor.constraint(equalTo: enggageCommentView.centerYAnchor),
            
            watchView.topAnchor.constraint(equalTo: enggageWatchView.topAnchor),
            watchView.bottomAnchor.constraint(equalTo: enggageWatchView.bottomAnchor),
            watchView.centerYAnchor.constraint(equalTo: enggageWatchView.centerYAnchor),
            
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuestionTableViewCell {
    
    func setupData(data: QuestionData, isList: Bool = false) {
        if !isList {
            iconArrow.isHidden = true
        }
        titleLbl.text = data.title
        tagLbl.text = data.tags.joined(separator: ", ")
        dateLbl.text = "Asked on " + String(describing: data.creationDate.secondToStringDate(format: "dd MMMM yyyy 'at' hh:mm") ?? "")
        voteView.setContentText(data.score.formatNumberThousand())
        commentView.setContentText(data.answerCount.formatNumberThousand())
        watchView.setContentText(data.viewCount.formatNumberThousand())
    }
    
    
}
