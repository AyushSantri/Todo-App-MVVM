//
//  CustomTextField.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 05/04/23.
//

import UIKit

class CustomTextField: UITextField {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    func setUpField() {
        font = .systemFont(ofSize: 24, weight: .regular)
        borderStyle = .none

        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 5
        autocorrectionType = .no
        becomeFirstResponder()
    }

}
