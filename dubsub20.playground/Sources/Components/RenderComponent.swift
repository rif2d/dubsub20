import GameplayKit
import SpriteKit

class RenderComponent: GKComponent {
    private var node: SKNode
    private var parent: SKNode
    
    init(node: SKNode, parent: SKNode) {
        self.node = node
        self.parent = parent

        super.init()
    }
    
    func render(){
        parent.addChild(node)
    }
    
    func unrender(){
        node.removeFromParent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
