import GameplayKit
import SpriteKit

extension GameScene {
    func setGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        pan.maximumNumberOfTouches = 1
        
        view?.gestureRecognizers?.removeAll()
        view?.addGestureRecognizer(tap)
        view?.addGestureRecognizer(pan)
        view?.addGestureRecognizer(rotation)
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer){
        let gestureViewLocation = sender.location(in: view)
        let gestureSceneLocation = convertPoint(fromView: gestureViewLocation)
        let gestureNode = atPoint(gestureSceneLocation)

        switch sender.state {
        case .began:
            gestureState = .changed
            if let pannedComponent = gestureNode.entity?.component(ofType: PanGestureComponent.self) {
                self.pannedComponent = pannedComponent
            }
        case .changed:
            pannedComponent?.position = gestureSceneLocation
            pannedComponent?.handlePan(sender: sender)
        case .ended:
            if let _ = pannedComponent {
                pannedComponent = nil
            }
            gestureState = .possible
        default:
            return
        }
    }
    
    @objc func handleRotation(_ sender: UIRotationGestureRecognizer){
        let gestureViewLocation = sender.location(in: view)
        let gestureSceneLocation = convertPoint(fromView: gestureViewLocation)
        let gestureNode = atPoint(gestureSceneLocation)
        let rotation = sender.rotation
        
        if let rotatedComponent = gestureNode.entity?.component(ofType: RotationGestureComponent.self) {
            rotatedComponent.handleRotation(sender: sender)
        }
        
        switch sender.state {
        case .began:
            gestureState = .changed
            if let rotatedComponent = gestureNode.entity?.component(ofType: RotationGestureComponent.self) {
                self.rotatedComponent = rotatedComponent
            }
        case .changed:
            rotatedComponent?.rotation = rotation
            rotatedComponent?.handleRotation(sender: sender)
        case .ended:
            if let _ = rotatedComponent{
                rotatedComponent = nil
            }
            gestureState = .possible
        default:
            return
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        let gestureViewLocation = sender.location(in: view)
        let gestureSceneLocation = convertPoint(fromView: gestureViewLocation)
        let gestureNode = atPoint(gestureSceneLocation)

        if let tap = gestureNode.entity?.component(ofType: TapGestureComponent.self){
            tap.handleTap(sender: sender)
        }
    }
}
