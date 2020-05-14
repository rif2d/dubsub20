import GameplayKit
import SpriteKit

extension GameScene {
    func setGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        view?.gestureRecognizers?.removeAll()
        view?.addGestureRecognizer(tap)
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
