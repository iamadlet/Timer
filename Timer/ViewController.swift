//
//  ViewController.swift
//  Timer
//
//  Created by Адлет Жумагалиев on 29.09.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startDate: UIDatePicker!
    
    @IBOutlet weak var endDate: UIDatePicker!
    
    var start: Date!
    var end: Date!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        start = startDate.date
        end = endDate.date
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            if let vc = segue.destination as? SecondViewController {
                vc.startDate = start
                vc.endDate = end
            }
        }
    }

    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        let formattedDateString = dateFormatter.string(from: selectedDate)
        start = startDate.date
    }

    @IBAction func endDateChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        let formattedDateString = dateFormatter.string(from: selectedDate)
        end = endDate.date
    }
}

