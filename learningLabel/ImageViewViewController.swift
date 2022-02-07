//
//  ImageViewViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/25.
//

import UIKit

class ImageViewViewController: UIViewController {

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var ImageView: UIImageView!
    var imageviewcontent = ["scaleToFill", "scaleAspectFit", "scaleAspectFill", "redraw", "center", "top", "bottom", "left", "right", "topLeft", "topRight", "bottomLeft", "bottomRight"]
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.delegate = self
        PickerView.dataSource = self
        ImageView.layer.borderWidth = 3
        ImageView.layer.borderColor = UIColor.black.cgColor
        PickerView.selectRow(1, inComponent: 0, animated: true)

        // Do any additional setup after loading the view.
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

extension ImageViewViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageviewcontent[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            ImageView.contentMode = .scaleToFill
        case 1:
            ImageView.contentMode = .scaleAspectFit
        case 2:
            ImageView.contentMode = .scaleAspectFill
        case 3:
            ImageView.contentMode = .redraw
        case 4:
            ImageView.contentMode = .center
        case 5:
            ImageView.contentMode = .top
        case 6:
            ImageView.contentMode = .bottom
        case 7:
            ImageView.contentMode = .left
        case 8:
            ImageView.contentMode = .right
        case 9:
            ImageView.contentMode = .topLeft
        case 10:
            ImageView.contentMode = .topRight
        case 11:
            ImageView.contentMode = .bottomLeft
        case 12:
            ImageView.contentMode = .bottomRight
        default:
            break
        }
    }
}

extension ImageViewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        imageviewcontent.count
    }
    
    
}
