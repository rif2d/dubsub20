import GameplayKit
import SpriteKit

class ShapeNodeComponent: GKComponent {
    var node: SKShapeNode

    private init(node: SKShapeNode){
        self.node = node
        super.init()
    }

    convenience init(points: [CGPoint]) {
        let path = CGMutablePath()
        path.addLines(between: points)
        path.closeSubpath()
        
        let node = SKShapeNode(path: path, centered: true)

        self.init(node: node)
    }

    override func didAddToEntity() {
        node.entity = entity
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
