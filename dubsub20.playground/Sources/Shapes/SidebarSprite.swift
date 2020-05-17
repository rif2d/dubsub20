import GameplayKit

class SidebarSprite: GKEntity {
    var node: SKNode {
        guard let node = component(ofType: SpriteNodeComponent
            .self)?.node else { return SKSpriteNode() }
        return node
    }
    
    var position: PositionComponent? {
        guard let position = component(ofType: PositionComponent
            .self) else { return nil }
        return position
    }
    
    var handler: () -> () = {} {
        didSet {
            component(ofType: TapGestureComponent.self)?.handler = handler
        }
    }

    init(name: String, size: CGFloat, parent: SKNode) {
        super.init()
        
        let shapeNode = SpriteNodeComponent(name: name, size: CGSize(width: size, height: size))
        addComponent(shapeNode)
        
        let position = PositionComponent(node: node)
        addComponent(position)
        
        let render = RenderComponent(node: node, parent: parent)
        addComponent(render)
        
        let tapGesture = TapGestureComponent()
        tapGesture.handler = handler
        addComponent(tapGesture)
    }

    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
}
