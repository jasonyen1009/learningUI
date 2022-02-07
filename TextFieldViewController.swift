//
//  TextFieldViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/24.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var TextField: UITextField!
    
    var choice = ["Border Style", "Clear Button", "keyboardType"]
    var BorderStyle = ["roundedRect", "none", "bezel", "line"]
    var clearbutton = ["always", "never", "unlessEditing", "whileEditing"]
    var keyboardType = ["default", "asciiCapable", "numbersAndPunctuation", "URL", "numberPad", "phonePad", "namePhonePad", "emailAddress", "decimalPad", "twitter", "webSearch", "asciiCapableNumberPad"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        TextField.borderStyle = .bezel
        TextField.delegate = self
        PickerView.delegate = self
        PickerView.dataSource = self
//        TextField.becomeFirstResponder()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    // closekeyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func TextField(_ sender: UITextField) {
    }
    

}

extension TextFieldViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string == "\n") {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    
    
}

extension TextFieldViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.isScrolling() {
            pickerView.isUserInteractionEnabled = false
        } else {
            pickerView.isUserInteractionEnabled = true
        }
        
        if component == 0 {
            return choice[row]
            
        }else {
            let selectRow = pickerView.selectedRow(inComponent: 0)
//            if selectRow == 0 {
//                return BorderStyle[row]
//            }else if selectRow == 1{
//                return clearbutton[row]
//            }else {
//                return keyboardType[row]
//            }
            switch selectRow {
            case 0:
                return BorderStyle[row]
            case 1:
                return clearbutton[row]
            default :
                return keyboardType[row]
            }

        }
    }
}

extension TextFieldViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return choice.count
        }else {
            let selectRow = pickerView.selectedRow(inComponent: 0)
            if selectRow == 0 {
                return BorderStyle.count
            }else if selectRow == 1 {
                return clearbutton.count
            }else {
                return keyboardType.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.isUserInteractionEnabled = true
        
        
        // 第一版
//        if component == 0 {
//            pickerView.reloadComponent(1)
//            pickerView.selectRow(0, inComponent: 1, animated: true)
//        }
//
//        let selectchoiceName = choice[pickerView.selectedRow(inComponent: 0)]
//
//
//        let selectrow = pickerView.selectedRow(inComponent: 1)
//        //判斷 Border Style
//        if selectchoiceName == "Border Style" {
//            print("yes")
//            switch selectrow {
//            case 0:
//                TextField.borderStyle = .roundedRect
//            case 1:
//                TextField.borderStyle = .none
//            case 2:
//                TextField.borderStyle = .bezel
//            case 3:
//                TextField.borderStyle = .line
//            default:
//                break
//            }
//        }else if selectchoiceName == "Clear Button" {
//            switch selectrow {
//            case 0:
//                TextField.clearButtonMode = .always
//            case 1:
//                TextField.clearButtonMode = .never
//            case 2:
//                TextField.clearButtonMode = .unlessEditing
//            case 3:
//                TextField.clearButtonMode = .whileEditing
//            default :
//                break
//            }
//        }else if selectchoiceName == "keyboardType" {
//            print("get keyboard")
//            switch selectrow {
//            case 0:
//                TextField.keyboardType = .default
//            case 1:
//                TextField.keyboardType = .asciiCapable
//            case 2:
//                TextField.keyboardType = .numbersAndPunctuation
//            case 3:
//                TextField.keyboardType = .URL
//            case 4:
//                TextField.keyboardType = .numberPad
//            case 5:
//                TextField.keyboardType = .phonePad
//            case 6:
//                TextField.keyboardType = .namePhonePad
//            case 7:
//                TextField.keyboardType = .emailAddress
//            case 8:
//                TextField.keyboardType = .decimalPad
//            case 9:
//                TextField.keyboardType = .twitter
//            case 10:
//                TextField.keyboardType = .webSearch
//            case 11:
//                TextField.keyboardType = .asciiCapableNumberPad
//            default:
//                break
//
//            }
            
            //第二版
        let selectRow = pickerView.selectedRow(inComponent: 0)
        let selectrow = pickerView.selectedRow(inComponent: 1)
            if component == 0 {
                pickerView.reloadComponent(1)
                pickerView.selectRow(0, inComponent: 1, animated: true)
            }else {
                if selectRow == 0{
                    switch selectrow {
                    case 0:
                        TextField.borderStyle = .roundedRect
                    case 1:
                        TextField.borderStyle = .none
                    case 2:
                        TextField.borderStyle = .bezel
                    case 3:
                        TextField.borderStyle = .line
                    default:
                        break
                    }
                }else if selectRow == 1 {
                    switch selectrow {
                    case 0:
                        TextField.clearButtonMode = .always
                    case 1:
                        TextField.clearButtonMode = .never
                    case 2:
                        TextField.clearButtonMode = .unlessEditing
                    case 3:
                        TextField.clearButtonMode = .whileEditing
                    default :
                        break
                    }
                }else {
                    switch selectrow {
                    case 0:
                        TextField.keyboardType = .default
                    case 1:
                        TextField.keyboardType = .asciiCapable
                    case 2:
                        TextField.keyboardType = .numbersAndPunctuation
                    case 3:
                        TextField.keyboardType = .URL
                    case 4:
                        TextField.keyboardType = .numberPad
                    case 5:
                        TextField.keyboardType = .phonePad
                    case 6:
                        TextField.keyboardType = .namePhonePad
                    case 7:
                        TextField.keyboardType = .emailAddress
                    case 8:
                        TextField.keyboardType = .decimalPad
                    case 9:
                        TextField.keyboardType = .twitter
                    case 10:
                        TextField.keyboardType = .webSearch
                    case 11:
                        TextField.keyboardType = .asciiCapableNumberPad
                    default:
                        break

                    }
                }
            
            
            
            
//            print(selectrow)
            view.endEditing(true)
        }
        
        
//        print("com \(component), row \(row)")
        
     }
    

}

//判斷手反在捲動
extension UIView {
func isScrolling () -> Bool {
        if let scrollView = self as? UIScrollView {
            if (scrollView.isDragging || scrollView.isDecelerating) {
                return true
            }
        }
        for subview in self.subviews {
            if subview.isScrolling() {
                return true
            }
        }
        return false
    }
}
