//
//  TextViewViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/25.
//

import UIKit

class TextViewViewController: UIViewController {

    @IBOutlet var `switch`: [UISwitch]!
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var TextView: UITextView!
    var keyboard = ["none", "onDrag", "interactive"]
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.delegate = self
        PickerView.delegate = self
        PickerView.dataSource = self
        

        // Do any additional setup after loading the view.
        
    }
    
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
    @IBAction func `switch`(_ sender: UISwitch) {
        if `switch`[0].isOn {
            TextView.isEditable = true
        }else {
            TextView.isEditable = false
        }
        if `switch`[1].isOn {
            TextView.isSelectable = true
        }else {
            TextView.isSelectable = false
        }
        
        
    }
    
}

extension TextViewViewController: UITextViewDelegate {
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        textView.resignFirstResponder()
//    }
    //按下 return 收鍵盤
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if (text == "\n") {
//            textView.resignFirstResponder()
//            return false
//        }
//        return true
//    }
    // hides text fields
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if (string == "\n") {
//            textField.resignFirstResponder()
//            return false
//        }
//        return true
//    }
}

extension TextViewViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keyboard[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            TextView.keyboardDismissMode = .none
        case 1:
            TextView.keyboardDismissMode = .onDrag
        default :
            TextView.keyboardDismissMode = .interactive
        }
    }
    
}

extension TextViewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        keyboard.count
    }
    
    
}
