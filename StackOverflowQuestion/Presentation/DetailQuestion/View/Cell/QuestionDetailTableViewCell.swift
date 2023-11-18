//
//  QuestionDetailTableViewCell.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import UIKit

class QuestionDetailTableViewCell: UITableViewCell {
    
    static let identifier = "QuestionDetailTableViewCell"
    
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        setupConstraint()
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuestionDetailTableViewCell {
    
    private func setupView() {
        contentView.addSubview(questionDetailLbl)
    }
    
    private func setupConstraint() {
        let safeArea = contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            questionDetailLbl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            questionDetailLbl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            questionDetailLbl.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            questionDetailLbl.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
        ])
    }
    
    func setupData(data: QuestionData) {
        questionDetailLbl.attributedText = "".attributedStringFromMarkdown(markdownString: data.bodyMarkdown ?? "")
    }
    
}
