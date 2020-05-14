import GameplayKit
import SpriteKit

class RotationGestureComponent: GKComponent {
    var rotation: CGFloat?
    var handler: (UIRotationGestureRecognizer) -> () = {gesture in }

    func handleRotation(sender: UIRotationGestureRecognizer){
        handler(sender)
    }
}
