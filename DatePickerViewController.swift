//
//  DatePickerViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/26.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    var choice = ["preferredDatePickerStyle", "Mode", "minuteInterval"]
    var preferredDatePickerStyle = ["automatic", "wheels", "compact", "inline"]
    var Mode = ["time", "date", "dateAndTime", "countDownTimer"]
    var Mode2 = ["time", "date", "dateAndTime"]
    var minuteInterval = ["1", "2", "3", "4", "5", "6", "10", "15", "20", "30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PickerView.delegate = self
        PickerView.dataSource = self

        
    }
    

}

extension DatePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectRow = pickerView.selectedRow(inComponent: 0)
//        let selectrow = pickerView.selectedRow(inComponent: 1)
        
        //原本版本
        if component == 0 {
            return choice[row]
        }else {
            switch selectRow {
            case 0:
                return preferredDatePickerStyle[row]
            case 1:
                //判斷 DatePicker preferredDatePickerStyle 是否為 compact & inline
                if DatePicker.preferredDatePickerStyle == .compact ||  DatePicker.preferredDatePickerStyle == .inline {
                    return Mode2[row]
                }else {
                    return Mode[row]
                }
//                return Mode[row]
            default :
                return minuteInterval[row]
            }
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectRow = pickerView.selectedRow(inComponent: 0)
        let selectrow = pickerView.selectedRow(inComponent: 1)
        
        //原本版本
        if component == 0 {
            pickerView.reloadComponent(1)
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
                //判斷 DatePicker preferredDatePickerStyle 是否為 compact & inline
                if DatePicker.preferredDatePickerStyle == .compact ||  DatePicker.preferredDatePickerStyle == .inline {
                    print("oneeee")
                    switch selectrow {
                        
                    case 0:
                        DatePicker.datePickerMode = .time
                    case 1:
                        DatePicker.datePickerMode = .date
                    case 2:
                        DatePicker.datePickerMode = .dateAndTime
                    default :
                        DatePicker.datePickerMode = .dateAndTime
                    }

                }else {
                    print("twoooo")
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


extension DatePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let selectRow = pickerView.selectedRow(inComponent: 0)
        //這段會閃退
//        let selectrow = pickerView.selectedRow(inComponent: 1)
        
        //原本版本
        if component == 0 {
            return choice.count
        }else {
            switch selectRow {
            case 0:
                return preferredDatePickerStyle.count
            case 1:
                //判斷 DatePicker preferredDatePickerStyle 是否為 compact & inline
                if DatePicker.preferredDatePickerStyle == .compact ||  DatePicker.preferredDatePickerStyle == .inline {
                    return Mode2.count
                }else {
                    return Mode.count
                }
            default :
                return minuteInterval.count
            }
        }
    }

}
