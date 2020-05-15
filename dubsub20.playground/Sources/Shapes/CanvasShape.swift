import GameplayKit

class CanvasShape: Shape {
    init(points: [CGPoint], color: UIColor, parent: SKNode) {
        super.init(points: points, color: color)
        
        let panGesture = PanGestureComponent()
        panGesture.handler = panHandler
        addComponent(panGesture)
        
        let rotationGesture = RotationGestureComponent()
        rotationGesture.handler = rotationHandler
        addComponent(rotationGesture)
        
        let render = RenderComponent(node: node, parent: parent)
        addComponent(render)
    }
    
    func panHandler(gesture: UIPanGestureRecognizer){
        guard let panPosition = panComponent.position else { return }
        
        if let parent = node.parent, let scene = node.scene {
            let relativePanPosition = scene.convert(panPosition, to: parent)
            position?.setPosition(relativePanPosition)
        }
    }
    
    func rotationHandler(gesture: UIRotationGestureRecognizer){
        guard let rotation = rotationComponent.rotation else { return }
        
        node.zRotation = -rotation
    }
    
    var panComponent: PanGestureComponent {
        guard let ref = component(ofType: PanGestureComponent.self) else {
            fatalError()
        }

        return ref
    }
    
    var rotationComponent: RotationGestureComponent {
        guard let ref = component(ofType: RotationGestureComponent.self) else {
            fatalError()
        }

        return ref
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
}

