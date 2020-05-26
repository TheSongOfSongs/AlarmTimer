import Foundation


class CustomAlarmManager {
    
    static let shared = CustomAlarmManager()
    
    private init() {}
    
    static var lastId: Int = 0
    
    var alarms: [CustomAlarm] = []
    
    func createAlarm(title: String, hour: Int, min: Int, sec: Int) -> CustomAlarm {
        CustomAlarmManager.lastId += 1
        let id: Int = CustomAlarmManager.lastId
        return CustomAlarm(id: id, title: title, hour: hour, min: min, sec: sec)
    }
    
    func addAlarm(_ alarm: CustomAlarm) {
        alarms.append(alarm)
        saveAlarm()
    }
    
    func removeAlarm(_ alarm: CustomAlarm) {
        if let index = alarms.firstIndex(of: alarm) {
            alarms.remove(at: index)
            saveAlarm()
        }
    }
    
    func updateAlarm(_ alarm: CustomAlarm) {
        guard let index = alarms.firstIndex(of: alarm) else { return }
        alarms[index] = alarm
        saveAlarm()
    }
    
    func saveAlarm() {
        Storage.store(alarms, to: .documents, as: "alarms.json")
    }
    
    func retrieveTodo() {
        alarms = Storage.retrive("alarms.json", from: .documents, as: [CustomAlarm].self) ?? []
        
        let lastId = alarms.last?.id ?? 0
        CustomAlarmManager.lastId = lastId
    }
}

