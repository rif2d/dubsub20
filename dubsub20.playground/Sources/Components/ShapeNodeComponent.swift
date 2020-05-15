import GameplayKit
import SpriteKit

class ShapeNodeComponent: GKComponent {
    var node: SKShapeNode

    private init(node: SKShapeNode){
        self.node = node
        super.init()
    }

    convenience init(points: [CGPoint], color: UIColor) {
        let path = CGMutablePath()
        path.addLines(between: points)
        path.closeSubpath()
        
        let node = SKShapeNode(path: path, centered: true)
        node.fillColor = color
        node.strokeColor = color
        node.lineWidth = 2
        node.isAntialiased = true

        self.init(node: node)
    }

    override func didAddToEntity() {
        node.entity = entity
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
