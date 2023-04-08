//
//  showDetailedTODOViewController.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 08/04/23.
//

import UIKit

class showDetailedTODOViewController: UIViewController {
    let titleLabel = customLabel()
    let descriptionLabel = customLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
    }
    
    
    func setUpLabel() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 20),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
