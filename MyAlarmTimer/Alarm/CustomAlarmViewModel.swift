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
    
    func alarmCount(sectionValue: Int) -> Int {
        let section = Section.init(rawValue: sectionValue)
        
        if section == .today {
            return manager.alarms.filter({$0.isToday}).count
        } else {
            return manager.alarms.filter({!$0.isToday}).count
        }
    }
    
    func createAlarm(title: String, hour: Int, min: Int, sec: Int, isToday: Bool) -> CustomAlarm {
        return manager.createAlarm(title: title, hour: hour, min: min, sec: sec, isToday: isToday)
    }
}

