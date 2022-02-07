//
//  ActivityIndicatorViewViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/26.
//

import UIKit

class ActivityIndicatorViewViewController: UIViewController {

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    var style = ["medium", "large", "whiteLargee", "white", "gray"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PickerView.delegate = self
        PickerView.dataSource = self

        // Do any additional setup after loading the view.
//        ActivityIndicator.stopAnimating()
    }
    
    @IBAction func changeAnimating(_ sender: UISwitch) {
        if sender.isOn {
            ActivityIndicator.startAnimating()
        }else {
            ActivityIndicator.stopAnimating()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ActivityIndicatorViewViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return style[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            ActivityIndicator.style = .medium
        case 1:
            ActivityIndicator.style = .large
        case 2:
            ActivityIndicator.style = .whiteLarge
        case 3:
            ActivityIndicator.style = .white
        default :
            ActivityIndicator.style = .gray
        }
    }
}

extension ActivityIndicatorViewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return style.count
    }
    
    
}
