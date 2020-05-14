import SpriteKit

class GameScene: SKScene {
    var shapeManager: ShapeManager!
    var toolbox: SKSpriteNode!
    var canvas: SKSpriteNode!
    var pannedComponent: PanGestureComponent?
    var rotatedComponent: RotationGestureComponent?
    var gestureState: UIGestureRecognizer.State = .possible
    
    func setContainer(){
        toolbox = childNode(withName: "toolbox") as? SKSpriteNode
        canvas = childNode(withName: "canvas") as? SKSpriteNode
    }
    
    func setToolbox(){
        let square = ToolboxShape(points: [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 50, y: 0),
            CGPoint(x: 50, y: 50),
            CGPoint(x: 0, y: 50),
        ], color: .red, parent: toolbox)
        
        shapeManager.insert(square)
    }
    
    override func sceneDidLoad() {
        shapeManager = ShapeManager(scene: self)
    }
    
    override func didMove(to view: SKView) {
        setGesture()
        setContainer()
        setToolbox()
    }
}
