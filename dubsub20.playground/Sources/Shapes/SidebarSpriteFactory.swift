import GameplayKit

class SidebarSpriteFactory {
    var scene: GameScene
    let spriteSize: CGFloat = 80
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func make(name: String, yPosition: CGFloat, handler: @escaping () -> ()) -> SidebarSprite {
        let sidebarSprite = SidebarSprite(name: name, size: spriteSize, parent: scene.sidebar)
        
        sidebarSprite.handler = handler
        sidebarSprite.position?.setPosition(CGPoint(x: 0, y: yPosition))
        
        return sidebarSprite
    }
    
    func showTask(){
        let taskMessage = "Task Detail Message"
        let alert = UIAlertController(title: "Task Description", message: taskMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { _ in }))
        
        scene.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func generate(){
        let taskSprite = make(name: "task_sprite", yPosition: -50, handler: showTask)
        scene.entityManager.insert(taskSprite)
    }
}
