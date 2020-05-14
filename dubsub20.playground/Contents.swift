import PlaygroundSupport
import UIKit

let gameVC = GameViewController()

gameVC.preferredContentSize = CGSize(
    width: 640,
    height: 480
)

PlaygroundPage.current.liveView = gameVC
