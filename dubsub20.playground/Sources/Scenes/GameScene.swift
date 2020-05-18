import SpriteKit
import GameplayKit

typealias Tasks = [Task]

public class GameScene: SKScene {
    var taskManager: TaskManager!
    var entityManager: EntityManager!
    var toolbox: SKSpriteNode!
    var canvas: SKSpriteNode!
    var sidebar: SKSpriteNode!
    var label: SKLabelNode!
    var bgm: SKAudioNode!
    
    private var lastUpdateTime : TimeInterval = 0
    var pannedComponent: PanGestureComponent?
    var rotatedComponent: RotationGestureComponent?
    var pinchedComponent: PinchGestureComponent?
    var gestureState: UIGestureRecognizer.State = .possible
    
    var availableTasks: Tasks {
        return [
            Task(name: "Flower Company", detail: "Flower Detail"),
            Task(name: "Brewery Logo", detail: "Brewery Detail"),
        ]
    }
    
    func setNode(){
        toolbox = childNode(withName: "//toolbox") as? SKSpriteNode
        canvas = childNode(withName: "//canvas") as? SKSpriteNode
        sidebar = childNode(withName: "//sidebar") as? SKSpriteNode
        label = childNode(withName: "//label") as? SKLabelNode
        bgm = childNode(withName: "//bgm") as? SKAudioNode
        
        bgm.run(SKAction.changeVolume(to: 0.7, duration: 0))
    }
    
    func setPlayground(){
        let toolboxFactory = ToolboxShapeFactory(scene: self)
        toolboxFactory.generate(size: 50)
        
        let sidebarFactory = SidebarSpriteFactory(scene: self)
        sidebarFactory.generate()
    }
    
    override public func sceneDidLoad() {
        entityManager = EntityManager(scene: self)
        taskManager = TaskManager(tasks: availableTasks)
    }
    
    override public func didMove(to view: SKView) {
        setGesture()
        setNode()
        setPlayground()
    }
    
    public override func update(_ currentTime: TimeInterval) {
        label.text = taskManager.currentTask?.name
    }
}
