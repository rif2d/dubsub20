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
            Task(name: "Puppify", detail: """
Puppify is a pet store that caters exclusively to dogs.

From food, supplements, grooming items, feeding and quality clothes including those that are handmade and imported.

Puppify ensures that your dog friends get the utmost top quality of pet supplies and care.
"""),
            Task(name: "COLDPINT", detail: """
COLDPINT is the ultimate destination for who happen to be lovers of fine wine, offering a selection of wines and beers from around the world.

The cocktail menu is organized by the four seasons, making the seemingly overwhelming choices a little bit easier to whittle down.

The measure of a bar is the experience of its customers – in hospitality, drinks and food COLDPINT has the fundamentals down to a fine art.

"""),
        ]
    }
    
    func setNode(){
        toolbox = childNode(withName: "//toolbox") as? SKSpriteNode
        canvas = childNode(withName: "//canvas") as? SKSpriteNode
        sidebar = childNode(withName: "//sidebar") as? SKSpriteNode
        label = childNode(withName: "//label") as? SKLabelNode
        bgm = childNode(withName: "//bgm") as? SKAudioNode
        
        bgm.run(SKAction.changeVolume(to: 0.2, duration: 0))
    }
    
    func setPlayground(){
        let toolboxFactory = ToolboxShapeFactory(scene: self)
        toolboxFactory.generate(size: 50)
        
        let sidebarFactory = SidebarSpriteFactory(scene: self)
        sidebarFactory.generate()
    }
    
    func playAudio(name: String){
        let audio = SKAction.playSoundFileNamed(name, waitForCompletion: false)
        run(audio)
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
