//

import WebKit

class RetroDetailViewController: UIViewController {
    
    var technique:String = ""
<<<<<<< HEAD
    var webView: WKWebView!

=======
    
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
    @IBOutlet weak var techniqueImage: UIImageView!
    @IBOutlet weak var retroLabel: UILabel!
    @IBOutlet weak var tv: UITextView!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        var retroPage = ""
        var url2:URL
        var urlStr = ""
        
        //TODO: determine more sustainable and extendable mechanism
=======
        
        var retroPage = ""
        
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
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
<<<<<<< HEAD
            case "retro-help": retroPage = "-help"
            default:
            retroPage = "1"
        }

        //TODO: slight hack leveraging retro web view page; look to abstract and create a more versitle web view controller
        if (technique == "StoryPointing") {
            urlStr = "https://aginic.com/story-pointing/"
        } else {
            urlStr = "https://aginic.com/retro"+retroPage+"/"
        }
        url2 = URL(string: urlStr)!
=======
        default:
            retroPage = "1"
        }

        let url2 = URL(string: "https://aginic.com/retro"+retroPage)!
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
        webView.load(URLRequest(url: url2))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func loadView() {
        webView = WKWebView()
<<<<<<< HEAD
        view = webView
    }
=======
        //webView.navigationDelegate = self
        view = webView
    }
    
    
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
