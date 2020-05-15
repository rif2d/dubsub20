import GameplayKit

class ToolboxShape: Shape {
    var handler: () -> () = {} {
        didSet {
            component(ofType: TapGestureComponent.self)?.handler = handler
        }
    }
    
    init(points: [CGPoint], color: UIColor, parent: SKNode) {
        super.init(points: points, color: color)
        
        let tapGesture = TapGestureComponent()
        tapGesture.handler = handler
        addComponent(tapGesture)
        
        let render = RenderComponent(node: node, parent: parent)
        addComponent(render)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
}

