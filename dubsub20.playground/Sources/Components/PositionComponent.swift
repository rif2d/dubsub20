import GameplayKit
import SpriteKit

class PositionComponent: GKComponent {
    var node: SKNode

    init(node: SKNode){
        self.node = node

        super.init()
    }

    convenience init(node: SKNode, initialPosition: CGPoint) {
        self.init(node: node)

        setPosition(initialPosition)
    }

    func setPosition(_ position: CGPoint, duration: TimeInterval = 0.0){
        let moveAction = SKAction.move(to: position, duration: duration)
        node.run(moveAction)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
