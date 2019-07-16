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
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var retroPage = ""
        
        switch technique {
            case "Well, Improve": retroPage = "1"
            case "Stop, Start, Continue": retroPage = "2"
            case "4Ls": retroPage = "3"
            case "Mad, Bad, Sad": retroPage = "4"
            case "Sailing": retroPage = "5"
            case "+ Δ": retroPage = "6"
            case "WARP": retroPage = "7"
            case "Proud, Worried": retroPage = "8"
            case "Lean Coffee": retroPage = "9"
            case "Hero, Guide, Treasure, Cavern": retroPage = "10"
        default:
            retroPage = "1"
        }

        let url2 = URL(string: "https://aginic.com/retro"+retroPage)!
        webView.load(URLRequest(url: url2))
        webView.allowsBackForwardNavigationGestures = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
 
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
        */
    }
    
    override func loadView() {
        webView = WKWebView()
        //webView.navigationDelegate = self
        view = webView
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

