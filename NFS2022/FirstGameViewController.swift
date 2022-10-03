
import UIKit

class FirstGameViewController: UIViewController {
   
    // MARK: - Private properties
  private var sprite = UIView()
  private var size : CGFloat = 50
  private var spriteLocation: Location = .center {
        willSet (newLocation) {
            spriteLayout(at: newLocation)
        }
    }
    
    // MARK: - Override methods
    override func viewDidLoad() {
    
        super.viewDidLoad()
        setUp()
        view.addSubview(sprite)
    }
   
    // MARK: - Private methods
  private func setUp(){
        sprite.frame.size = CGSize(width: size, height: size)
        sprite.center = view.center
        sprite.backgroundColor = .orange
    
        addSwipeGesture(to: sprite, direction: .right)
        addSwipeGesture(to: sprite, direction: .left)
        
        func addSwipeGesture (to view:UIView,direction: UISwipeGestureRecognizer.Direction){
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveSprite))
            swipeGesture.direction = direction
            view.addGestureRecognizer(swipeGesture)
        }
    }
    
    @objc private func moveSprite(_ gestureRecogniser: UISwipeGestureRecognizer){
        
        switch gestureRecogniser.direction{
        case .left:
            if spriteLocation == .right {
               spriteLocation = .center
            } else if spriteLocation == .center {
                      spriteLocation = .left
            }
            
        case .right:
            if spriteLocation == .center{
               spriteLocation = .right
            } else if spriteLocation == .left{
                      spriteLocation = .center
            }
        default: return
        }
    }
    
  private func spriteLayout( at location : Location){
        switch location {
            
        case .left:
            sprite.frame.origin.x = 0
            
        case .center:
            sprite.center = view.center
            
        case .right:
            sprite.frame.origin.x = view.frame.width - size
        }
    }
}
