//
//  AddDataController.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 04/04/23.
//

import UIKit

class AddDataController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Task"
        setupTextField()
    }
    
    let textfield : TextField = {
        let field = TextField()
        field.placeholder = "Enter Your TODO"
        field.font = .systemFont(ofSize: 24, weight: .medium)
        field.borderStyle = .none

        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.cornerRadius = 5
        field.becomeFirstResponder()
        
        return field
    }()

    func setupTextField() {
        textfield.autocorrectionType = .no
        
        view.addSubview(textfield)
        
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            textfield.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            textfield.heightAnchor.constraint(equalToConstant: 24*2.3)
        ])
    }
}

public class TextField : UITextField {
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
}
