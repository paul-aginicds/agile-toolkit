//
//  RetroDetailViewContoller.swift
//  AginicDS Agile Toolkit
//
//  Created by Paul Thornton on 07/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import WebKit

class RetroDetailViewController: UIViewController {
    
    var technique:String = ""
    var file:String = "Retro1"
    
    @IBOutlet weak var techniqueImage: UIImageView!
    
    @IBOutlet weak var retroLabel: UILabel!
    
    @IBOutlet weak var tv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        retroLabel.text = technique
        
        // TODO: image dimensions (source) to determine
        //techniqueImage.image = UIImage(named: "retro-sailing.jpeg")
        
        
        // Map techniquew to file
        if technique == "Stop, Start, Continue" {
            file = "Retro2"
            techniqueImage.image = UIImage(named: "retro2.png")
        }else {
            techniqueImage.image = UIImage(named: "retro1.jpeg")
        }
        
        // Load in appropriate Retro technique text
        let url = Bundle.main.url(forResource: file, withExtension: "rtf")!
        let opts : [NSAttributedString.DocumentReadingOptionKey : Any] =
            [.documentType : NSAttributedString.DocumentType.rtf]
        var d : NSDictionary? = nil
        let s = try! NSAttributedString(url: url, options: opts, documentAttributes: &d)
        self.tv.attributedText = s
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

