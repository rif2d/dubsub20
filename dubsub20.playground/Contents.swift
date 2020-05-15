import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(
    x:0,
    y:0,
    width: 720,
    height: 540
))

if let scene = GameScene(fileNamed: "GameScene") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView
