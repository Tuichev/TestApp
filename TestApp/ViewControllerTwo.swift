//
//  ViewControllerTwo.swift
//  TestApp
//
//  Created by Lampa on 21.12.2019.
//  Copyright © 2019 isHidden. All rights reserved.
//

import UIKit

class ViewControllerTWO: UIViewController {
    
    var callback: (() -> Void)?
    
    let buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("HIT THIS BUTTON!", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTwoPressed), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    @objc func buttonTwoPressed() {
        print("PRESSEDDDD")
        callback?()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(buttonTwo)
        
        NSLayoutConstraint.activate([
            buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}

class ErrorView: UIView {
    
    
    fileprivate let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("DISMISS!!!!", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12
        return button
    }()
    
    @objc func dismissButtonPressed() {
        self.errorGoAway()
    }
    
    
    fileprivate let errorViewBox: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 24
        return v
    }()
    
    @objc fileprivate func errorGoAway() {
        self.alpha = 0
    }
    
    @objc fileprivate func errorShow() {
        self.alpha = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(errorGoAway)))
        self.backgroundColor = UIColor.gray
        self.backgroundColor?.withAlphaComponent(0.8)
        self.frame = UIScreen.main.bounds
        self.addSubview(errorViewBox)
        
        errorViewBox.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        errorViewBox.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        errorViewBox.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        errorViewBox.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        
        errorViewBox.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: errorViewBox.leadingAnchor).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: errorViewBox.trailingAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: errorViewBox.centerYAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: errorViewBox.heightAnchor, multiplier: 0.15).isActive = true
        
        errorShow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
