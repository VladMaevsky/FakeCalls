import Foundation
import UserNotifications

class NotificationManager {
    
    static var shared = NotificationManager()
    
    func accessRequestForNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func setNotification(after: Int, title: String, body: String, identifier: String) {
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let triggerDay = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(after),
                                                           repeats: false)
        
        let requestDay = UNNotificationRequest(identifier: identifier,
                                               content: content, trigger: triggerDay)
        
        UNUserNotificationCenter.current().add(requestDay, withCompletionHandler: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        })
    }
    
    func removeNotification(identifier: String) {
        let center = UNUserNotificationCenter.current()
        center.removeDeliveredNotifications(withIdentifiers: [identifier])
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}
