import GameplayKit

class ToolboxShapeFactory {
    var colors: [UIColor] = [.systemPink, .systemBlue, .systemGreen, .systemYellow, .white]
    var scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func make(triangle: Triangle, color: UIColor, size: Int) -> ToolboxShape {
        let points = triangle.points(CGFloat(size))
        let toolboxShape = ToolboxShape(points: points, color: color, parent: scene.toolbox)
        
        toolboxShape.handler = {
            let canvasShapePoints = triangle.points(CGFloat(size * 4))
            let canvasShape = CanvasShape(points: canvasShapePoints, color: color, parent: self.scene.canvas)
            let canvasFrame = self.scene.canvas.frame
            let positionX = CGFloat.random(in: 100...canvasFrame.width - 100)
            let positionY = CGFloat.random(in: 100...canvasFrame.height - 100)
            let position = CGPoint(x: positionX, y: -positionY)
            
            canvasShape.node.setScale(1/4)
            canvasShape.position?.setPosition(position)
            
            self.scene.entityManager.insert(canvasShape)
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
            
            scene.entityManager.insert(shape)
        }
        
        for (n, color) in colors.enumerated() {
            let shape = make(triangle: .right, color: color, size: size)
            
            let xPosition = block1 + 2 * size + 2 * (n * size)
            let yPosition = -size
            let position = CGPoint(x: xPosition, y: yPosition)
            
            shape.position?.setPosition(position)
            
            scene.entityManager.insert(shape)
        }
    }
}
