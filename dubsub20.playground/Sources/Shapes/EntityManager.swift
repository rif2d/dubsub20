import GameplayKit

class EntityManager {
    var entities = Set<GKEntity>()
    var scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func insert(_ shape: GKEntity){
        entities.insert(shape)
        
        if let renderable = shape.component(ofType: RenderComponent.self) {
            renderable.render()
        }
    }
    
    func remove(_ shape: GKEntity){
        entities.remove(shape)
        
        if let renderable = shape.component(ofType: RenderComponent.self) {
            renderable.unrender()
        }
    }
}
