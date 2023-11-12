//
//  CalendarScreen.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit
import UserNotifications

final class CalendarScreen: UIView {

    lazy var calendar: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let selectedDateTime = sender.date
        print("Data e horário selecionados: \(selectedDateTime)")
        
        scheduleNotification(date: selectedDateTime)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        AddElements()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func AddElements() {
        addSubview(calendar)
    }
      
    private func addConstraints() {
        NSLayoutConstraint.activate([
            calendar.centerXAnchor.constraint(equalTo: centerXAnchor),
            calendar.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func scheduleNotification(date: Date) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "Notificação"
                content.body = "Tarefas para hoje"
                content.sound = UNNotificationSound.default
                
                let calendar = Calendar.current
                
                let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                
                let request = UNNotificationRequest(identifier: "ScheduledNotification", content: content, trigger: trigger)
                
                notificationCenter.add(request) { (error) in
                    if let error = error {
                        print("Erro ao agendar a notificação: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
