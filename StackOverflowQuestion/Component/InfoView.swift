//
//  InfoView.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 17/11/23.
//

import UIKit


class InfoView: UIView {
    
    
    private let imgView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let contentLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imgHeight: NSLayoutConstraint!
    var imgWidth: NSLayoutConstraint!
    
    private func configureSubviews() {
        addSubview(imgView)
        addSubview(contentLbl)
        imgWidth = imgView.widthAnchor.constraint(equalToConstant: 0)
        imgHeight = imgView.heightAnchor.constraint(equalToConstant: 0)
        
        if imgWidth.constant != 0 {
            imgWidth.isActive = true
        }else {
            imgWidth.isActive = false
        }
        
        if imgHeight.constant != 0 {
            imgHeight.isActive = true
        }else {
            imgHeight.isActive = false
        }
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentLbl.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            contentLbl.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            contentLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentLbl.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setIconImage(_ image: UIImage?) {
        imgView.image = image
    }
    
    func setContentText(_ content: String) {
        contentLbl.text = content
    }
    
    func setTintColor(_ color: UIColor) {
        imgView.tintColor = color
    }
    
    func setTextColor(_ color: UIColor) {
        contentLbl.textColor = color
    }
    
    func setFont(_ font: UIFont!) {
        contentLbl.font = font
    }
    
    func setImageSize(width: Int, height: Int) {
        imgWidth.constant = CGFloat(width)
        imgHeight.constant = CGFloat(height)
    }
}
