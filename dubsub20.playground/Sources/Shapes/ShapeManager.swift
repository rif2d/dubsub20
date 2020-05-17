import GameplayKit

class EntityManager {
    var shapes = Set<GKEntity>()
    var scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func insert(_ shape: GKEntity){
        shapes.insert(shape)
        
        if let renderable = shape.component(ofType: RenderComponent.self) {
            renderable.render()
        }
    }
    
    func remove(_ shape: GKEntity){
        shapes.remove(shape)
        
        if let renderable = shape.component(ofType: RenderComponent.self) {
            renderable.unrender()
        }
    }
}
