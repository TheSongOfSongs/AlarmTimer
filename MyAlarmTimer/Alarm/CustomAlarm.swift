import Foundation


struct CustomAlarm: Codable, Equatable {
    let id: Int
    var title: String
    var hour: Int
    var min: Int
    var sec: Int
    
    mutating func update(title: String, hour: Int, min: Int, sec: Int) {
        self.title = title
        self.hour = hour
        self.min = min
        self.sec = sec
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

