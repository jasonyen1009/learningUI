//
//  VisualEffectViewwithBlurViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/26.
//

import UIKit

class VisualEffectViewwithBlurViewController: UIViewController {

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var VisualEffectViewwithBlur: UIVisualEffectView!
    
    var BlurStyle = ["extraLight" ,"light", "dark", "regular", "prominent", "systemUltraThinMaterial", "systemThinMaterial", "systemMaterial", "systemThickMaterial", "systemChromeMaterial", "systemUltraThinMaterialLight", "systemThinMaterialLight", "systemMaterialLight", "systemThickMaterialLight", "systemChromeMaterialLight", "systemUltraThinMaterialDark", "systemThinMaterialDark", "systemMaterialDark", "systemThickMaterialDark", "systemChromeMaterialDark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PickerView.delegate = self
        PickerView.dataSource = self
        

        // Do any additional setup after loading the view.
//        VisualEffectViewwithBlur.effect = UIBlurEffect(style: .)
        
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

extension VisualEffectViewwithBlurViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return BlurStyle[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .extraLight)
        case 1:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .light)
        case 2:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .dark)
        case 3:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .regular)
        case 4:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .prominent)
        case 5:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemUltraThinMaterial)
        case 6:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemThinMaterial)
        case 7:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemMaterial)
        case 8:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemThickMaterial)
        case 9:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemChromeMaterial)
        case 10:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        case 11:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemThinMaterialLight)
        case 12:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemMaterialLight)
        case 13:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemThickMaterialLight)
        case 14:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemChromeMaterialLight)
        case 15:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        case 16:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemThinMaterialDark)
        case 17:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemMaterialDark)
        case 18:
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemThickMaterialDark)
        default :
            VisualEffectViewwithBlur.effect = UIBlurEffect(style: .systemChromeMaterialDark)
            
        }
    }
}

extension VisualEffectViewwithBlurViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return BlurStyle.count
    }
    
    
}
