import Foundation


struct CustomAlarm: Codable, Equatable {
    let id: Int
    var title: String
    var hour: Int
    var min: Int
    var sec: Int
    var isToday: Bool
    
    mutating func update(title: String, hour: Int, min: Int, sec: Int, isToday: Bool) {
        self.title = title
        self.hour = hour
        self.min = min
        self.sec = sec
        self.isToday = isToday
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

