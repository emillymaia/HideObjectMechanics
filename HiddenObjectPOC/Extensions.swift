import UIKit

extension ViewController2 {

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        showAlert(message: "You did it!")
    }

    @objc func pannedView(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            print(recognizer.view?.layer.name as Any)
            view.subviews.first(where: {$0.layer.name == recognizer.view?.layer.name})?.layer.zPosition = 5
        case .changed:
            let translation = recognizer.translation(in: view)
            recognizer.view?.center = CGPoint(
                x: (recognizer.view?.center.x)! + translation.x,
                y: (recognizer.view?.center.y)! + translation.y)

            recognizer.setTranslation(.zero, in: view)
        case .ended, .cancelled, .failed:
            view.subviews.first(where: {$0.layer.name == recognizer.view?.layer.name})?.layer.zPosition = 1
        case .possible:
            break
        @unknown default:
            print("Unknown Error")
        }
    }

    func setup() {
        let setupWinner = winnerSetup()
        winnerBoxDynamic(item: setupWinner)

        listSetup()

        for item in boxes {
            boxDynamic(item: item)
        }
        objectToFind.image = setupWinner.image
        objectToFind.frame.size = CGSize(width: 50, height: 50)
        view.addSubview(objectToFind)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            objectToFind.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            objectToFind.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 275)
        ])
    }

    @objc func randomizePosition(item: UIImageView) {
        let maxX = (view.frame.maxX)
        let maxY = (view.frame.maxY)
        let xCoord = CGFloat.random(in: (-maxX/2)+50...(maxX/2)-50)
        let yCoord = CGFloat.random(in: (-maxY/2)+200...(maxY/2)-200)

        UIView.animate(withDuration: 0.7) {
            item.transform = CGAffineTransform(translationX: xCoord, y: yCoord)
        }
    }

    func listSetup() {
        for index in 1...150 {
            let image = images[Int.random(in: 0...images.count-1)]
            let box: UIImageView = UIImageView(image: UIImage(named: image))
            box.frame.size = CGSize(width: 50, height: 50)
            box.layer.name = "\(image) \(index)"
            boxes.append(box)
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func boxDynamic(item: UIImageView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
        item.addGestureRecognizer(panGesture)
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        randomizePosition(item: item)
        view.addSubview(item)

        NSLayoutConstraint.activate([
            item.widthAnchor.constraint(equalToConstant: 50),
            item.heightAnchor.constraint(equalToConstant: 50),
            item.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            item.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func winnerSetup() -> UIImageView {
        let image = images[Int.random(in: 0...images.count-1)]
        images.removeAll(where: { $0 == image })
        print(image)
        print(images)
        let box: UIImageView = UIImageView(image: UIImage(named: image))
        box.frame.size = CGSize(width: 50, height: 50)
        box.layer.name = image
        return box
    }

    func winnerBoxDynamic(item: UIImageView) {

        let panGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        panGesture.numberOfTapsRequired = 1
        item.addGestureRecognizer(panGesture)
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        randomizePosition(item: item)
        view.addSubview(item)
        view.subviews.first(where: {$0.layer.name == item.layer.name})?.layer.zPosition = -5

        NSLayoutConstraint.activate([
            item.widthAnchor.constraint(equalToConstant: 50),
            item.heightAnchor.constraint(equalToConstant: 50),
            item.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            item.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
