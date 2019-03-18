//
//  TestView.swift
//  Timer
//
//  Created by Manikandan P on 15/03/19.
//  Copyright © 2019 Manikandan P. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    let button:UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("Test Button", for: .normal)
        return button
    }()
    
    let label:UILabel = {
        var label = UILabel()
        label.text = "Test Lable"
        label.textColor = .red
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        addSubview(label)
        addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.center.x = center.x
    }
}
