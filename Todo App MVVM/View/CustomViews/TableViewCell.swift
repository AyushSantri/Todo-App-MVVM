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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let lable : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium, width: .condensed)
        label.textColor = .label
        label.text = "Ayush Santri is Cool"
        return label
    }()
}

extension TableViewCell {
    private func setUpLabel() {
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lable.topAnchor.constraint(equalTo: contentView.topAnchor),
            lable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
