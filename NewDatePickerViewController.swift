//
//  NewDatePickerViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/31.
//

import UIKit

class NewDatePickerViewController: UIViewController {
    
    
    var choice = ["preferredDatePickerStyle", "Mode", "minuteInterval"]
    var preferredDatePickerStyle = ["automatic", "wheels", "compact", "inline"]
    var Mode = ["time", "date", "dateAndTime", "countDownTimer"]
    var Mode2 = ["time", "date", "dateAndTime"]
    var minuteInterval = ["1", "2", "3", "4", "5", "6", "10", "15", "20", "30"]

    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var PickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PickerView.delegate = self
        PickerView.dataSource = self
        
    }
    

}

extension NewDatePickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectRow = pickerView.selectedRow(inComponent: 0)
        let selectrow = pickerView.selectedRow(inComponent: 1)
        
        //第二版
        if component == 0 {
            return choice[row]
        }else {
            if choice[selectRow] == "preferredDatePickerStyle",  preferredDatePickerStyle[selectrow] == "compact" || preferredDatePickerStyle[selectrow] == "inline" {
                switch selectRow {
                case 0:
                    return preferredDatePickerStyle[row]
                case 1:
                    return Mode2[row]
                default :
                    return minuteInterval[row]
                }
            }else {
                switch selectRow {
                case 0:
                    return preferredDatePickerStyle[row]
                case 1:
                    return Mode[row]
                default :
                    return minuteInterval[row]
                }
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectRow = pickerView.selectedRow(inComponent: 0)
        let selectrow = pickerView.selectedRow(inComponent: 1)
        
        //第二版
        if component == 0 {
            pickerView.reloadComponent(1)
        }else {
            if choice[selectRow] == "preferredDatePickerStyle",  preferredDatePickerStyle[selectrow] == "compact" || preferredDatePickerStyle[selectrow] == "inline" {
                if selectRow == 0{
                    switch selectrow {
                    case 0:
                        DatePicker.preferredDatePickerStyle = .automatic
                    case 1:
                        DatePicker.preferredDatePickerStyle = .wheels
                    case 2:
                        DatePicker.preferredDatePickerStyle = .compact
                    default :
                        DatePicker.preferredDatePickerStyle = .inline
                    }
                }else if selectRow == 1 {
                    switch selectrow {
                    case 0:
                        DatePicker.datePickerMode = .time
                    case 1:
                        DatePicker.datePickerMode = .date
                    case 2:
                        DatePicker.datePickerMode = .dateAndTime
                    default :
                        break
                    }
                }else {
                    switch selectrow {
                    case 0:
                        DatePicker.minuteInterval = 1
                    case 1:
                        DatePicker.minuteInterval = 2
                    case 2:
                        DatePicker.minuteInterval = 3
                    case 3:
                        DatePicker.minuteInterval = 4
                    case 4:
                        DatePicker.minuteInterval = 5
                    case 5:
                        DatePicker.minuteInterval = 6
                    case 6:
                        DatePicker.minuteInterval = 10
                    case 7:
                        DatePicker.minuteInterval = 15
                    case 8:
                        DatePicker.minuteInterval = 20
                    default :
                        DatePicker.minuteInterval = 30
                    }
                }
            }else {
                if selectRow == 0{
                    switch selectrow {
                    case 0:
                        DatePicker.preferredDatePickerStyle = .automatic
                    case 1:
                        DatePicker.preferredDatePickerStyle = .wheels
                    case 2:
                        DatePicker.preferredDatePickerStyle = .compact
                    default :
                        DatePicker.preferredDatePickerStyle = .inline
                    }
                }else if selectRow == 1 {
                    switch selectrow {
                    case 0:
                        DatePicker.datePickerMode = .time
                    case 1:
                        DatePicker.datePickerMode = .date
                    case 2:
                        DatePicker.datePickerMode = .dateAndTime
                    default :
                        DatePicker.datePickerMode = .countDownTimer
                    }
                }else {
                    switch selectrow {
                    case 0:
                        DatePicker.minuteInterval = 1
                    case 1:
                        DatePicker.minuteInterval = 2
                    case 2:
                        DatePicker.minuteInterval = 3
                    case 3:
                        DatePicker.minuteInterval = 4
                    case 4:
                        DatePicker.minuteInterval = 5
                    case 5:
                        DatePicker.minuteInterval = 6
                    case 6:
                        DatePicker.minuteInterval = 10
                    case 7:
                        DatePicker.minuteInterval = 15
                    case 8:
                        DatePicker.minuteInterval = 20
                    default :
                        DatePicker.minuteInterval = 30
                    }
                }
            }
        }
    }
    
}

extension NewDatePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let selectRow = pickerView.selectedRow(inComponent: 0)
        let selectrow = pickerView.selectedRow(inComponent: 1)
        
        //第二版
        if component == 0 {
            return choice.count
        }else {
            if choice[selectRow] == "preferredDatePickerStyle",  preferredDatePickerStyle[selectrow] == "compact" || preferredDatePickerStyle[selectrow] == "inline" {
                switch selectRow {
                case 0:
                    return preferredDatePickerStyle.count
                case 1:
                    return Mode2.count
                default :
                    return minuteInterval.count
                }
            }else {
                switch selectRow {
                case 0:
                    return preferredDatePickerStyle.count
                case 1:
                    return Mode.count
                default :
                    return minuteInterval.count
                }
            }
        }
    }
    
    
}
