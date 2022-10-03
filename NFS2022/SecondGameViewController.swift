

import UIKit

class SecondGameViewController: UIViewController {
    // MARK: - Private properties
    let sprite = UIView()
    let size: CGFloat = 50
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.addSubview(sprite)
    }
    
    // MARK: - Private methods
    private func setup(){
        sprite.frame.size = CGSize(width: size, height: size)
        sprite.center = view.center
        sprite.backgroundColor = .blue
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.sprite.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed{
            let newView = gestureRecognizer.view!
            let translation = gestureRecognizer.translation(in: newView.superview)
            newView.center = CGPoint(x: newView.center.x + translation.x, y: newView.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: newView.superview)
            outOfBorder(myView: newView)
            
        }
    }
    private func outOfBorder(myView : UIView) {
        let outOfLeftBorder = myView.center.x <= size/2
        let outOfRightBorder = myView.center.x >= view.frame.width - size/2
        let outOfTopBorder = myView.center.y <= 110
        let outOfBotBorder = myView.center.y >= view.frame.height - size/2
        
        if outOfBotBorder || outOfTopBorder || outOfLeftBorder || outOfRightBorder{
            showAlert()
            myView.center = view.center
        }
        
    }
    
    private func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Out of bounds", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present (alert, animated: true)
    }
}
