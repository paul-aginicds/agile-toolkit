//
//  RetroViewController.swift
//  AginicDS Agile Toolkit
//
//  Created by Paul Thornton on 07/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import WebKit

class RetroViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    var s:String = ""
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func didHitButton(_ sender: UIButton) {
        
        s = pickerData[picker.selectedRow(inComponent: 0)]

    }
    
    let pickerData = ["Well, Improve","Stop, Start, Continue","4Ls","Mad, Bad, Sad","Sailing","+ Δ", "WARP", "Proud, Worried", "Lean Coffee", "Hero, Guide, Treasure, Cavern"]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        picker.delegate = self
        picker.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RetroDetailViewController
        {
            let vc = segue.destination as? RetroDetailViewController
            vc?.technique = s
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

