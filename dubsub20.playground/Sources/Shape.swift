import GameplayKit

class Shape: GKEntity {
    var node: SKShapeNode {
        guard let node = component(ofType: ShapeNodeComponent
            .self)?.node else { return SKShapeNode() }
        return node
    }

    init(points: [CGPoint]) {
        super.init()
        
        let shapeNodeComponent = ShapeNodeComponent(points: points)
        addComponent(shapeNodeComponent)
    }

    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
}
