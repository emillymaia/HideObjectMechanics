import UIKit

class ViewController2: UIViewController {

    var boxes: [UIImageView] = []
    var images: [String] = ["chicken", "cow", "crab", "dog", "fish", "lion", "monkey", "turtle", "whale"]

    let objectToFind: UIImageView = {
        let object = UIImageView()
        object.translatesAutoresizingMaskIntoConstraints = false
        return object
    }()

    let label: UILabel = {
        let label = UILabel()
        label.text = "Encontre:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame.size = CGSize(width: 100, height: 50)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setup()
    }
}
