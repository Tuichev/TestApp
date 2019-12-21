//
//  ViewController.swift
//  TestApp
//
//  Created by Lampa on 21.12.2019.
//  Copyright © 2019 isHidden. All rights reserved.
//

import UIKit

class ViewControllerONE: UIViewController {
    
    var score = 10
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = String(score)
        label.font = .systemFont(ofSize: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scoreLabel)
        
        var VC: ViewControllerTWO?
        
        let arrayOfVC = self.tabBarController?.viewControllers ?? []
        
        for item in arrayOfVC {
            if let secondVC = item as? ViewControllerTWO {
                VC = secondVC
                break
            }
        }
       
        VC?.callback = { [weak self ] in
            let error = ErrorView()
            self?.view.addSubview(error)
        }
        
        NSLayoutConstraint.activate([
            scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}

