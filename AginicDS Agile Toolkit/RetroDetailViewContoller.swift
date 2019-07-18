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

