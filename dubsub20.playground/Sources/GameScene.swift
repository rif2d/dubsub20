import SpriteKit

class GameScene: SKScene {
    var toolbox: SKSpriteNode!
    var canvas: SKSpriteNode!
    
    func setContainer(){
        toolbox = childNode(withName: "toolbox") as? SKSpriteNode
        canvas = childNode(withName: "canvas") as? SKSpriteNode
    }
    
    override func didMove(to view: SKView) {
        setContainer()
    }
}
