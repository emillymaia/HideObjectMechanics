//
//  MenuView.swift
//  HiddenObjectPOC
//
//  Created by Emilly Maia on 24/08/23.
//

import UIKit

final class MenuView: UIView {
    weak var menuViewController: MenuViewController?
    
    private let fase1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 12
        button.setTitle("Fase 1", for: .normal)
        return button
    }()
    
    private let fase2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 12
        button.setTitle("Fase 2", for: .normal)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapFase1() {
        menuViewController?.pushFase1ViewController()
    }
    
    @objc private func tapFase2() {
        menuViewController?.pushFase2ViewController()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fase1.centerXAnchor.constraint(equalTo: centerXAnchor),
            fase1.centerYAnchor.constraint(equalTo: centerYAnchor),
            fase1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            fase2.centerXAnchor.constraint(equalTo: centerXAnchor),
            fase2.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            fase2.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(fase1)
        addSubview(fase2)
        setupConstraints()
        
        fase1.addTarget(self, action: #selector(tapFase1), for: .touchUpInside)
        fase2.addTarget(self, action: #selector(tapFase2), for: .touchUpInside)
    }
}

class MenuViewController: UIViewController {
    private let menuView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        menuView.menuViewController = self
        menuView.backgroundColor = .white
    }
    
    func pushFase1ViewController() {
        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushFase2ViewController() {
        let viewController = ViewController2()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
