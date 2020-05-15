import GameplayKit

enum Size: CGFloat {
    case small = 10
    case medium = 20
    case large = 30
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
    
    init(toolbox: SKNode) {
        self.toolbox = toolbox
    }
    
    func make(shape: Shaper, color: UIColor) -> ToolboxShape {
        return ToolboxShape(points: shape.points(), color: color, parent: toolbox)
    }
}
