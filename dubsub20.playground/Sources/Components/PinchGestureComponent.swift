import GameplayKit
import SpriteKit

class PinchGestureComponent: GKComponent {
    var handler: (UIPinchGestureRecognizer) -> () = {gesture in }

    func handlePinch(sender: UIPinchGestureRecognizer){
        handler(sender)
    }
}
