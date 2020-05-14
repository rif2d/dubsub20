import GameplayKit
import SpriteKit

class PanGestureComponent: GKComponent {
    var position: CGPoint?
    var handler: (UIPanGestureRecognizer) -> () = {gesture in }
    var endedHandler: (UIPanGestureRecognizer) -> () = {gesture in }

    func handlePan(sender: UIPanGestureRecognizer){
        handler(sender)
    }
    
    func handleEnded(sender: UIPanGestureRecognizer){
        endedHandler(sender)
    }
}
