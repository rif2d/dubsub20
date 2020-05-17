import GameplayKit
import SpriteKit

class SpriteNodeComponent: GKComponent {
    var node: SKSpriteNode!

    init(name: String, size: CGSize){
        super.init()
        node = SKSpriteNode(imageNamed: name)
        node.size = size
        node.anchorPoint = CGPoint(x: 0, y: 1)
    }

    override func didAddToEntity() {
        node.entity = entity
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
