import SpriteKit

public class GameScene: SKScene {
    var entityManager: EntityManager!
    var toolbox: SKSpriteNode!
    var canvas: SKSpriteNode!
    var sidebar: SKSpriteNode!
    
    var pannedComponent: PanGestureComponent?
    var rotatedComponent: RotationGestureComponent?
    var gestureState: UIGestureRecognizer.State = .possible
    
    func setNode(){
        toolbox = childNode(withName: "//toolbox") as? SKSpriteNode
        canvas = childNode(withName: "//canvas") as? SKSpriteNode
        sidebar = childNode(withName: "//sidebar") as? SKSpriteNode
    }
    
    func setPlayground(){
        let toolboxFactory = ToolboxShapeFactory(scene: self)
        toolboxFactory.generate(size: 50)
        
        let sidebarFactory = SidebarSpriteFactory(scene: self)
        sidebarFactory.generate()
    }
    
    override public func sceneDidLoad() {
        entityManager = EntityManager(scene: self)
    }
    
    override public func didMove(to view: SKView) {
        setGesture()
        setNode()
        setPlayground()
    }
}
