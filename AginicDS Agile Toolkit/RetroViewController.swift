//

import WebKit

class RetroViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    var s:String = ""
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func didHitButton(_ sender: UIButton) {
        s = pickerData[picker.selectedRow(inComponent: 0)]
    }
    
    @IBAction func didHitHelpButton(_ sender: Any) {
        s = "retro-help"
    }
    
    //TODO: move to data source so content management possible without app re-release
    let pickerData = [
        "Well, Improve",
        "Stop, Start, Continue",
        "4Ls",
        "Mad, Bad, Sad",
        "Agile Sailing",
        "+ Δ",
        "WARP",
        "Proud, Worried",
        "Lean Coffee",
        "Hero, Guide, Treasure, Cavern",
        "FLAP",
        "Circle Celebration",
        "Pleasure Gain",
        "Isn't It Crazy"
    ]
    
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
        
        picker.delegate = self
        picker.dataSource = self
<<<<<<< HEAD
        picker.selectRow(pickerData.count / 2, inComponent: 0, animated: true)
=======
        
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RetroDetailViewController
        {
            let vc = segue.destination as? RetroDetailViewController
            vc?.technique = s
        }
        
    }
    @IBAction func supriseMeButton(_ sender: Any) {
        
        let number = Int.random(in: 0 ..< pickerData.count)
        
        print(number)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.picker.selectRow(0, inComponent: 0, animated: true)
            print(0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.picker.selectRow(11, inComponent: 0, animated: true)
            print(11)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            self.picker.selectRow(2, inComponent: 0, animated: true)
            print(2)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.picker.selectRow(5, inComponent: 0, animated: true)
            print(5)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            self.picker.selectRow(1, inComponent: 0, animated: true)
            print(1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
            self.picker.selectRow(9, inComponent: 0, animated: true)
            print(9)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.picker.selectRow(number, inComponent: 0, animated: true)
            print(number)
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

