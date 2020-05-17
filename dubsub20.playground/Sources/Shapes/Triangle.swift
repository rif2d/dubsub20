import SpriteKit

enum Triangle: CaseIterable {
    case isosceles
    case right
    
    func points(_ size: CGFloat) -> [CGPoint] {
        switch self {
        case .isosceles:
            return [
                CGPoint(x: 0, y: 0),
                CGPoint(x: size, y: 0),
                CGPoint(x: size/2, y: size),
            ]
        case .right:
            return [
                CGPoint(x: 0, y: 0),
                CGPoint(x: size, y: 0),
                CGPoint(x: 0, y: size),
            ]
        }
    }
}
