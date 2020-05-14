import UIKit
import GameplayKit

public class GameViewController: UIViewController {
    typealias Tasks = [Task]
    var taskManager: TaskManager!
    
    func availableTasks() -> Tasks {
        return [
            BreweryCompanyTask()
        ]
    }

    func setupTaskManager(){
        taskManager = TaskManager(states: availableTasks())
    }

    public override func viewDidLoad() {
        setupTaskManager()
    }
}
