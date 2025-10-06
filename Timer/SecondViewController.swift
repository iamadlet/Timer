//
//  SecondViewController.swift
//  Timer
//
//  Created by Адлет Жумагалиев on 29.09.2025.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var startDate: Date!
    var endDate: Date!
    private var timerDate: Date!
    
    var savedTime: Date!
    
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        timerDate = startDate

        savedTime = startDate
        
        startLabel.text = formatter(startDate)
        endLabel.text = formatter(endDate)
        timerLabel.text = formatter(startDate)
        
        
    }
    
    @objc func countTime() {
        timerLabel.text = formatter(timerDate)
        timerDate = Calendar.current.date(byAdding: .minute, value: 1, to: timerDate) ?? timerDate
        if timerDate > endDate {
            timer.invalidate()
            isTimerRunning = false
            return
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if isTimerRunning == true {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        startDate = savedTime
        timerLabel.text = formatter(startDate)
    }
    
    func timeString(time: Int) -> String {
        let hour = time / 3600
        let minute = time / 60 % 60
        let second = time % 60
        
        // return formated string
        return String(format: "%02i:%02i:%02i", hour, minute, second)
    }
    
    func formatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: date)
    }
}
