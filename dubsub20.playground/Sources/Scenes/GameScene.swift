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
        let toolboxFactory = ToolboxShapeFactory(toolbox: toolbox)
        let square = toolboxFactory.make(shape: .square(.medium), color: .red)
        
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
