import GameplayKit

class TaskManager {
    var availableTasks: Tasks
    var currentTask: Task?
    
    init(tasks: Tasks) {
        self.availableTasks = tasks
        let _ = enter()
    }
    
    func enter() -> Bool {
        if availableTasks.count > 0 {
            self.currentTask = availableTasks[0]
            return true
        }
        return false
    }
    
    func next() -> Bool {
        guard let currentTask = currentTask else { return false }
        guard let index = availableTasks.firstIndex(of: currentTask) else { return false }
        
        availableTasks.remove(at: index)
        return enter()
    }
}
