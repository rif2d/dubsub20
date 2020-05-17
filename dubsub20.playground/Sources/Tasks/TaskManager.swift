import GameplayKit

class TaskManager: GKStateMachine {
    var currentTask: Task? {
        return currentState as? Task
    }
    
    init(states: Tasks) {
        super.init(states: states)
    }
}
