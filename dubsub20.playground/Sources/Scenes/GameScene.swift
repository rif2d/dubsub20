import SpriteKit

public class GameScene: SKScene {
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
        toolboxFactory.generate(manager: shapeManager, size: 50)
    }
    
    override public func sceneDidLoad() {
        shapeManager = ShapeManager(scene: self)
    }
    
    override public func didMove(to view: SKView) {
        setGesture()
        setContainer()
        setToolbox()
    }
}
