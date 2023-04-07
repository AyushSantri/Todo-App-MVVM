//
//  AddDataController.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 04/04/23.
//

import UIKit

class AddDataController: UIViewController {
    let arr : [String] = ["Enter title", "Enter discreption", "Priority"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Task"
        configureStackView()
    }
    
    let stackView = UIStackView()
    
    func configureStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        addtextFieldInStackView()
        setStackViewConstraints()
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func addtextFieldInStackView() {
        let numberOfField : Int = arr.count-1
        
        for i in 0...numberOfField {
            let customTextField = CustomTextField()
            customTextField.placeholder = arr[i]
            stackView.addArrangedSubview(customTextField)
        }
    }
}
