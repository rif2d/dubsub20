import UIKit
import GameplayKit

public class GameViewController: UIViewController {
    func setupView(){
        self.view = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
        
        if let scene = GameScene(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            
            if let view = self.view as! SKView? {
                view.presentScene(scene)
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
            }
        }
    }

    public override func loadView() {
        setupView()
    }
}
