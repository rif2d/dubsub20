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
        scene.playAudio(name: "click.wav")
        
        let title = scene.taskManager.currentTask?.name
        let message = scene.taskManager.currentTask?.detail
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Finish", style: .default, handler: { _ in
            let nextAvailable = self.scene.taskManager.next()
            
            if nextAvailable {
                self.clearCanvas()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { _ in }))
        
        scene.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func clearCanvas(){
        scene.playAudio(name: "delete.wav")
        
        let shapes = scene.entityManager.entities.filter { type(of: $0) == CanvasShape.self }
        shapes.forEach { scene.entityManager.remove($0) }
    }
    
    func generate(){
        let taskSprite = make(name: "task_sprite", yPosition: -50, handler: showTask)
        scene.entityManager.insert(taskSprite)
        
        let trashSprite = make(name: "trash_sprite", yPosition: -150, handler: clearCanvas)
        scene.entityManager.insert(trashSprite)
    }
}
