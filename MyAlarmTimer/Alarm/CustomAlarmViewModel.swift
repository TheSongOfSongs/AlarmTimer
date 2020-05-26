import Foundation


class CustomAlarmViewModel {
    
    enum Section: Int, CaseIterable {
        case everyday
        case today
        
        var title: String {
            switch self {
            case .everyday:
                return "오늘"
            default:
                return "매일"
            }
        }
    }
    
    private let manager = CustomAlarmManager.shared
    
    var alarms: [CustomAlarm] {
        return manager.alarms
    }
    
    var numOfSection: Int {
        return Section.allCases.count
    }
    
    func addAlarm(alarm: CustomAlarm) {
        manager.addAlarm(alarm)
    }
    
    func loadAlarms() {
        manager.retrieveTodo()
    }
}

