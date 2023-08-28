//
//  TouchableImage.swift
//  HiddenObjectPOC
//
//  Created by Emilly Maia on 22/08/23.
//

import UIKit

class TouchableImage: UIImageView {
    //aqui vou fazer um componente que todos os "sapinhos" vão assinar na criação. Vai ser uma classe q vai conter todas as infos personalizadas que precisarei para instanciar os ícones na tela.
    
    //Futuramente, penso em criar uma classe pra organizar os parâmetros dos ícones (pode ser baseado na fase/mapa/país só pra específicar um array daquele tipo, daí criar os componentes a partir dos elementos desse array.
    weak var viewController: ViewController?
        var successTag: Int = 0
        
        init(image: UIImage?, tag: Int, successTag: Int, viewController: ViewController) {
            super.init(image: image)
            self.tag = tag
            self.successTag = successTag
            self.viewController = viewController
            
            self.translatesAutoresizingMaskIntoConstraints = false
            self.contentMode = .scaleAspectFit
            self.isUserInteractionEnabled = true
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            self.addGestureRecognizer(tapGesture)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
            if self.tag == successTag {
                viewController?.showAlert(message: "Parabéns! Você encontrou o objeto!")
            } else {
                viewController?.showAlert(message: "Não era esse!")
            }
        }
}
