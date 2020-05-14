import GameplayKit

class ToolboxShape: Shape {
    
    override init(points: [CGPoint], color: UIColor) {
        super.init(points: points, color: color)
        
        let tapGesture = TapGestureComponent()
        tapGesture.handler = handler
        addComponent(tapGesture)
    }
    
    func handler() {
        print("TAPPED")
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
}

