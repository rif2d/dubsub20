import GameplayKit

class ToolboxShapeFactory {
    var colors: [UIColor] = [.systemPink, .systemBlue, .systemGreen, .systemYellow, .white]
    var scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func make(triangle: Triangle, color: UIColor, size: Int) -> ToolboxShape {
        let points = triangle.points(size)
        let toolboxShape = ToolboxShape(points: points, color: color, parent: scene.toolbox)
        
        toolboxShape.handler = {
            let canvasShape = CanvasShape(points: points, color: color, parent: self.scene.canvas)
            self.scene.shapeManager.insert(canvasShape)
        }
        
        return toolboxShape
    }
    
    func generate(size: Int){
        var block1 = 0
        for (n, color) in colors.enumerated() {
            let shape = make(triangle: .isosceles, color: color, size: size)
            
            let xPosition = size + 2 * (n * size)
            let yPosition = -size
            let position = CGPoint(x: xPosition, y: yPosition)
            block1 = xPosition
            
            shape.position?.setPosition(position)
            
            scene.shapeManager.insert(shape)
        }
        
        for (n, color) in colors.enumerated() {
            let shape = make(triangle: .right, color: color, size: size)
            
            let xPosition = block1 + 2 * size + 2 * (n * size)
            let yPosition = -size
            let position = CGPoint(x: xPosition, y: yPosition)
            
            shape.position?.setPosition(position)
            
            scene.shapeManager.insert(shape)
        }
    }
}
