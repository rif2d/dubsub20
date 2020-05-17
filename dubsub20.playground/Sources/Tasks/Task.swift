import GameplayKit

class Task: GKState {
    var name: String
    var detail: String
    
    init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}
