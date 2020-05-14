import SpriteKit

class GameScene: SKScene {
    var toolbox: SKSpriteNode!
    var canvas: SKSpriteNode!
    var pannedComponent: PanGestureComponent?
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
        ], color: .red)
        
        let square1 = CanvasShape(points: [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 50, y: 0),
            CGPoint(x: 50, y: 50),
            CGPoint(x: 0, y: 50),
        ], color: .red)
        
        toolbox.addChild(square.node)
        canvas.addChild(square1.node)
    }
    
    override func didMove(to view: SKView) {
        setGesture()
        setContainer()
        setToolbox()
    }
}
