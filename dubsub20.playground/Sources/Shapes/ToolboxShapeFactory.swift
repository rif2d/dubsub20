import GameplayKit

class ToolboxShapeFactory {
    var toolbox: SKNode
    var colors: [UIColor] = [.systemPink, .systemBlue, .systemGreen, .systemYellow, .white]
    
    init(toolbox: SKNode) {
        self.toolbox = toolbox
    }
    
    func make(triangle: Triangle, color: UIColor, size: Int) -> ToolboxShape {
        return ToolboxShape(points: triangle.points(size), color: color, parent: toolbox)
    }
    
    func generate(manager: ShapeManager, size: Int){
        var block1 = 0
        for (n, color) in colors.enumerated() {
            let shape = make(triangle: .isosceles, color: color, size: size)
            
            let xPosition = size + 2 * (n * size)
            let yPosition = -size
            let position = CGPoint(x: xPosition, y: yPosition)
            block1 = xPosition
            
            shape.position?.setPosition(position)
            
            manager.insert(shape)
        }
        
        for (n, color) in colors.enumerated() {
            let shape = make(triangle: .right, color: color, size: size)
            
            let xPosition = block1 + 2 * size + 2 * (n * size)
            let yPosition = -size
            let position = CGPoint(x: xPosition, y: yPosition)
            
            shape.position?.setPosition(position)
            
            manager.insert(shape)
        }
    }
}
