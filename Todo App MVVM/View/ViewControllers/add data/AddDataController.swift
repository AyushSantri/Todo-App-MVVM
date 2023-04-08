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
        setScrollView()
        navigationItem.title = "Add Task"
        configureStackView()
    }
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    func configureStackView() {
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        addtextFieldInStackView()
        setStackViewConstraints()
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setScrollView() {
        view.addSubview(scrollView)
        
        scrollView.alwaysBounceVertical = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func addtextFieldInStackView() {
        let numberOfField : Int = arr.count-1
        
        for i in 0...numberOfField {
            let customTextField = CustomTextField()
            customTextField.placeholder = arr[i]
            customTextField.resignFirstResponder()
            if(arr[i] == "Priority") {
                customTextField.keyboardType = .numberPad
            }
            stackView.addArrangedSubview(customTextField)
        }
    }
}
