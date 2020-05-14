import GameplayKit
import SpriteKit

class PanGestureComponent: GKComponent {
    var position: CGPoint?
    var handler: (UIPanGestureRecognizer) -> () = {gesture in }

    func handlePan(sender: UIPanGestureRecognizer){
        handler(sender)
    }
}
