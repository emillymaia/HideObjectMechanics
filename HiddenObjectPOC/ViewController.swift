//
//  ViewController.swift
//  HiddenObjectPOC
//
//  Created by Emilly Maia on 21/08/23.
//

import UIKit

class MyView: UIView {
    weak var viewController: ViewController?
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.minimumZoomScale = 1.0
        view.maximumZoomScale = 3.0
        return view
    }()
    
    let background: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Fotoo")
        img.contentMode = .scaleAspectFill
        img.tag = 3
        img.isUserInteractionEnabled = true
        return img
    }()
    
    let sapo: UIImageView = {
        let sapo = UIImageView()
        sapo.translatesAutoresizingMaskIntoConstraints = false
        sapo.image = UIImage(named: "pirulito")
        sapo.contentMode = .scaleAspectFit
        sapo.tag = 1
        sapo.isUserInteractionEnabled = true
        return sapo
    }()
    
    let objectToFind: UIImageView = {
        let object = UIImageView()
        object.translatesAutoresizingMaskIntoConstraints = false
        object.image = UIImage(named: "pirulito")
        object.tintColor = .white
        object.backgroundColor = .white
        object.layer.cornerRadius = 40
        return object
    }()
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sapo.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: 95),
            sapo.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: 220),
            sapo.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.07),
            
            objectToFind.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            objectToFind.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250)
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        background.addSubview(sapo)
        background.addSubview(objectToFind)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        background.addGestureRecognizer(tap2)
        sapo.addGestureRecognizer(tap)
        setupConstraints()
    }
    

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if gesture.view?.tag == 1 {
            viewController?.showAlert(message: "Parabéns! Você encontrou o objeto!")
        }
        else {
            viewController?.showAlert(message: "Objeto errado :c")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    private let myView = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.viewController = self
        view = myView
    }
    
    public func showAlert(message: String) {
        let alert = UIAlertController(title: "Resultado", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

