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
    
    let smallLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular, width: .standard)
        label.textColor = .systemBlue
        label.text = "read more"
        
        
        return label
    }()
    
    @objc func presentPagetile() {
        let addDataController = AddDataController()
        
        addDataController.modalPresentationStyle = .pageSheet
        addDataController.sheetPresentationController?.detents = [.medium()]
        addDataController.sheetPresentationController?.prefersGrabberVisible = true
    }
}

extension TableViewCell {
    private func addViews() {
        contentView.addSubview(lable)
        contentView.addSubview(smallLabel)
        
        setUpLabel()
        setButton()
    }
    
    private func setUpLabel() {
        
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lable.trailingAnchor.constraint(equalTo: smallLabel.leadingAnchor, constant: -20),
            lable.topAnchor.constraint(equalTo: contentView.topAnchor),
            lable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            lable.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setButton() {
        
        
        smallLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            smallLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            smallLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            smallLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
