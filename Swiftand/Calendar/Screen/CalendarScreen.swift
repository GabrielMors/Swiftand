//
//  CalendarScreen.swift
//  Swiftand
//
//  Created by Alexandre Brigolin on 28/09/23.
//

import UIKit
import UserNotifications

final class CalendarScreen: UIView {

    var notesTextFieldHeightConstraint: NSLayoutConstraint!
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Agende sua próxima tarefa!"
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    lazy private var calendarDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.tintColor = .white
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let selectedDateTime = sender.date
        print("Data e horário selecionados: \(selectedDateTime)")
        
        scheduleNotification(date: selectedDateTime)
    }
    
    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(tappedEditButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedEditButton() {
        print("Botão Editar pressionado!")
    }
    
    lazy var removeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash.circle.fill"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(tappedRemoveButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedRemoveButton() {
        print("Botão Remove pressionado!")
    }
    
    lazy var notesTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.backgroundColor = .clear
        return textView
    }()

    public func configTextViewDelegate(textView: UITextViewDelegate) {
        notesTextView.delegate = textView
    }
    
    lazy var scheduleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Agendar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedButton() {
        print("Botão agendar pressionado!")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        AddElements()
        addConstraints()
        configCalendar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func AddElements() {
        addSubview(titleLabel)
        addSubview(calendarDatePicker)
        addSubview(cardContainerView)
        cardContainerView.addSubview(editButton)
        cardContainerView.addSubview(removeButton)
        cardContainerView.addSubview(notesTextView)
        addSubview(scheduleButton)
    }
    
    private func configCalendar() {
        calendarDatePicker.isHidden = false
    }
    
    func adjustHeightForTextField() {
          let maxHeight: CGFloat = 200
          let minHeight: CGFloat = 80

          let textHeight = notesTextView.sizeThatFits(CGSize(width: notesTextView.bounds.width, height: CGFloat.greatestFiniteMagnitude)).height

          let newHeight = max(minHeight, min(maxHeight, textHeight))

          notesTextFieldHeightConstraint.constant = newHeight
          cardContainerView.heightAnchor.constraint(equalToConstant: newHeight + 30).isActive = true
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
    
    private func addConstraints() {
        
        notesTextFieldHeightConstraint = notesTextView.heightAnchor.constraint(equalToConstant: 40)
        notesTextFieldHeightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            calendarDatePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            calendarDatePicker.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            
            cardContainerView.topAnchor.constraint(equalTo: self.calendarDatePicker.bottomAnchor, constant: 40),
            cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardContainerView.heightAnchor.constraint(equalToConstant: 80),
            
            editButton.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 10),
            editButton.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -8),
            editButton.heightAnchor.constraint(equalToConstant: 25),
            editButton.widthAnchor.constraint(equalToConstant: 25),
            
            removeButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 10),
            removeButton.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -8),
            removeButton.heightAnchor.constraint(equalToConstant: 25),
            removeButton.widthAnchor.constraint(equalToConstant: 25),
            
            scheduleButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            scheduleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            scheduleButton.widthAnchor.constraint(equalToConstant: 160),
            scheduleButton.heightAnchor.constraint(equalToConstant: 40),
            
            notesTextView.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 15),
            notesTextView.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 8),
            notesTextView.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -4),
        ])
    }
}

