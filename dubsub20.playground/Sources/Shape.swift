import GameplayKit

class Shape: GKEntity {
    var node: SKNode {
        guard let node = component(ofType: ShapeNodeComponent
            .self)?.node else { return SKShapeNode() }
        return node
    }
    
    var position: PositionComponent? {
        guard let position = component(ofType: PositionComponent
            .self) else { return nil }
        return position
    }

    init(points: [CGPoint], color: UIColor) {
        super.init()
        
        let shapeNode = ShapeNodeComponent(points: points, color: color)
        addComponent(shapeNode)
        
        let position = PositionComponent(node: node)
        addComponent(position)
    }

    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
}
