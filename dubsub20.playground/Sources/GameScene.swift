import SpriteKit

class GameScene: SKScene {
    var toolbox: SKSpriteNode!
    var canvas: SKSpriteNode!
    
    func setContainer(){
        toolbox = childNode(withName: "toolbox") as? SKSpriteNode
        canvas = childNode(withName: "canvas") as? SKSpriteNode
    }
    
    func setToolbox(){
        let square = Shape(points: [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 50, y: 0),
            CGPoint(x: 50, y: 50),
            CGPoint(x: 0, y: 50),
        ])
        
        square.node.fillColor = .red
        square.node.lineWidth = 0
        
        toolbox.addChild(square.node)
    }
    
    override func didMove(to view: SKView) {
        setContainer()
        setToolbox()
    }
}
