//
//  ViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var LabelheightConstraint: NSLayoutConstraint!
    
    var LabelLineBreak = [".byClipping", ".byCharWrapping", ".byWordWrapping", ".byTruncatingHead",  ".byTruncatingMiddle", ".byTruncatingTail"]

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.dataSource = self
        PickerView.delegate = self
        Label.layer.borderColor = UIColor.black.cgColor
        Label.layer.borderWidth = 2
        
//        Label.lineBreakMode = .byTruncatingMiddle
    }
    
    @IBAction func changeLabelHeight(_ sender: UISlider) {
        LabelheightConstraint.constant = CGFloat(sender.value)
    }
    

}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return LabelLineBreak[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectRow = pickerView.selectedRow(inComponent: 0)
        switch selectRow {
        case 0:
            Label.lineBreakMode = .byClipping
        case 1:
            Label.lineBreakMode = .byCharWrapping
        case 2:
            Label.lineBreakMode = .byWordWrapping
        case 3:
            Label.lineBreakMode = .byTruncatingHead
        case 4:
            Label.lineBreakMode = .byTruncatingMiddle
        case 5:
            Label.lineBreakMode = .byTruncatingTail
        default :
            break
        }
    }
    
    
    
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return LabelLineBreak.count
    }
    
    
}

