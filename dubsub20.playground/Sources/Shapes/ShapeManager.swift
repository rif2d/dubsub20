import GameplayKit

class ShapeManager {
    var shapes = Set<Shape>()
    var scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func insert(_ shape: Shape){
        shapes.insert(shape)
    }
    
    func remove(_ shape: Shape){
        shapes.remove(shape)
    }
}
