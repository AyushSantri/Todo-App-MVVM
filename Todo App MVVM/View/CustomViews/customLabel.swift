//
//  customLabel.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 08/04/23.
//

import UIKit

class customLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLabel() {
        textColor = .darkText
        textAlignment = .center
    }
}
