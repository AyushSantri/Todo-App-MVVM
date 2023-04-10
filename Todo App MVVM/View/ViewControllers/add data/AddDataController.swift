//
//  AddDataController.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 04/04/23.
//

import UIKit

protocol sendDataToAdd {
    func addData(titleToAdd : String, detailedTAsk : String, priority : Int16)
}

class AddDataController: UIViewController {
    let field1 = CustomTextField()
    let field2 = CustomTextField()
    let field3 = CustomTextField()
    var delegate : sendDataToAdd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        navigationItem.title = "Add Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addDataToCoreData))
        configureStackView()
    }
    
    @objc func addDataToCoreData() {
//        let vc = ViewController()
//        vc.addData(titleToAdd: field1.text!, detailedTAsk: field2.text!, priority: Int16(field3.text!)!)
        delegate!.addData(titleToAdd: field1.text!, detailedTAsk: field2.text!, priority: Int16(field3.text!)!)
        navigationController?.popViewController(animated: true)
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
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -30)
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
        
        field1.resignFirstResponder()
        field2.resignFirstResponder()
        field3.resignFirstResponder()
        
        field1.heightAnchor.constraint(equalToConstant: 70).isActive = true
        field2.heightAnchor.constraint(equalToConstant: 70).isActive = true
        field3.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        field1.placeholder = "Enter Title"
        field2.placeholder = "Enter Description"
        field3.placeholder = "Priority"
        
        field3.keyboardType = .numberPad
        
        stackView.addArrangedSubview(field1)
        stackView.addArrangedSubview(field2)
        stackView.addArrangedSubview(field3)
    }
}
