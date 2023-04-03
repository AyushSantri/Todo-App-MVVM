//
//  TableViewCell.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 03/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let lable : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium, width: .standard)
        label.textColor = .label
        label.text = "Ayush Santri is sick as funch jnoihjoiwqd"
        
        
        return label
    }()
    
    let button : UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("read more", for: .normal)
   
        return button
    }()
}

extension TableViewCell {
    private func addViews() {
        contentView.addSubview(lable)
        contentView.addSubview(button)
        
        setUpLabel()
        setButton()
    }
    
    private func setUpLabel() {
        
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lable.trailingAnchor.constraint(equalTo: button.leadingAnchor),
            lable.topAnchor.constraint(equalTo: contentView.topAnchor),
            lable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            lable.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setButton() {
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            button.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
        ])
    }
}
