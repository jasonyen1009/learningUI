//
//  ProgressViewViewController.swift
//  learningLabel
//
//  Created by Hong Cheng Yen on 2022/1/30.
//

import UIKit

class ProgressViewViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    //Time
    var time = Timer()
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "\(index) %"
        
//        progress.progress = 0.3

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            self.numberLabel.text = String("\(self.index * 10) %")
            self.progress.progress = Float(Double(self.index) / 10)
            self.index += 1
            if self.index == 11 {
                self.index = 0
            }
            
            
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
