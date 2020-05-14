import GameplayKit

class TapGestureComponent: GKComponent {
    var handler = {}

    func handleTap(sender: UITapGestureRecognizer){
        handler()
    }
}
