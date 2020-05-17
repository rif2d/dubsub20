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
    
    private var lastUpdateTime : TimeInterval = 0
    var pannedComponent: PanGestureComponent?
    var rotatedComponent: RotationGestureComponent?
    var gestureState: UIGestureRecognizer.State = .possible
    
    var availableTasks: Tasks {
        return [
            Task(name: "Flower Company", detail: "Flower Detail")
        ]
    }
    
    func setNode(){
        toolbox = childNode(withName: "//toolbox") as? SKSpriteNode
        canvas = childNode(withName: "//canvas") as? SKSpriteNode
        sidebar = childNode(withName: "//sidebar") as? SKSpriteNode
        label = childNode(withName: "//label") as? SKLabelNode
    }
    
    func setPlayground(){
        let toolboxFactory = ToolboxShapeFactory(scene: self)
        toolboxFactory.generate(size: 50)
        
        let sidebarFactory = SidebarSpriteFactory(scene: self)
        sidebarFactory.generate()
    }
    
    override public func sceneDidLoad() {
        entityManager = EntityManager(scene: self)
        
        let firstTask = availableTasks.first!
        taskManager = TaskManager(states: availableTasks)
        taskManager.enter(type(of: firstTask))
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
