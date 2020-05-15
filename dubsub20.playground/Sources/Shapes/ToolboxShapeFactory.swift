import GameplayKit

enum Size: Int {
    case medium = 40
    case large = 50
}

enum Shaper {
    case square(Size)
    case triangle(Size)
    
    func points() -> [CGPoint] {
        switch self {
        case .square(let size):
            return [
                CGPoint(x: 0, y: 0),
                CGPoint(x: size.rawValue, y: 0),
                CGPoint(x: size.rawValue, y: size.rawValue),
                CGPoint(x: 0, y: size.rawValue),
            ]
        case .triangle(_):
            return [
                CGPoint(x: 0, y: 0)
            ]
        }
    }
}

class ToolboxShapeFactory {
    var toolbox: SKNode
    var colors: [UIColor] = [.systemPink, .systemBlue, .systemGreen, .systemYellow]
    
    init(toolbox: SKNode) {
        self.toolbox = toolbox
    }
    
    func make(shape: Shaper, color: UIColor) -> ToolboxShape {
        return ToolboxShape(points: shape.points(), color: color, parent: toolbox)
    }
    
    func generate(manager: ShapeManager){
        for (n, color) in colors.enumerated() {
            let shape = make(shape: .square(.medium), color: color)
            
            let blockSize = Size.medium.rawValue
            let margin = 20
            
            let xPosition = blockSize + (n * blockSize) + ( n * margin)
            let yPosition = -blockSize
            let position = CGPoint(x: xPosition, y: yPosition)
            
            shape.position?.setPosition(position)
            
            manager.insert(shape)
        }
    }
}
