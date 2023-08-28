//
//  MenuView.swift
//  HiddenObjectPOC
//
//  Created by Emilly Maia on 24/08/23.
//

import UIKit

final class MenuView: UIView {
    
    private let fase1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.red
        return button
    }()
    
    private let fase2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.red
        button.addTarget(<#T##target: Any?##Any?#>, action: #selector(<#T##@objc method#>), for: <#T##UIControl.Event#>)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fase1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            fase1.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            
            fase2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 40),
            fase2.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30)

        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(fase1)
        addSubview(fase2)
        
    }
}

final class MenuViewController: UIViewController {
    private let menuView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
    }
}
