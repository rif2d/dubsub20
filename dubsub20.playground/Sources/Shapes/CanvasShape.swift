import GameplayKit

class CanvasShape: Shape {
    override init(points: [CGPoint], color: UIColor) {
        super.init(points: points, color: color)
        
        let panGesture = PanGestureComponent()
        panGesture.handler = panHandler
        addComponent(panGesture)
        
        let rotationGesture = RotationGestureComponent()
        rotationGesture.handler = rotationHandler
        addComponent(rotationGesture)
    }
    
    func panHandler(gesture: UIPanGestureRecognizer){
        guard let panPosition = panComponent.position else { return }
        
        if let parent = node.parent, let scene = node.scene {
            let relativePanPosition = scene.convert(panPosition, to: parent)
            position?.setPosition(relativePanPosition, duration: 0.01)
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

