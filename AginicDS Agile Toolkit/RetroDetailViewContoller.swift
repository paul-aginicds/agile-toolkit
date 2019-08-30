//

import WebKit

class RetroDetailViewController: UIViewController {
    
    var technique:String = ""
    var webView: WKWebView!

    @IBOutlet weak var techniqueImage: UIImageView!
    @IBOutlet weak var retroLabel: UILabel!
    @IBOutlet weak var tv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var retroPage = ""
        var url2:URL
        var urlStr = ""
        
        //TODO: determine more sustainable and extendable mechanism
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
        webView.load(URLRequest(url: url2))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func loadView() {
        webView = WKWebView()
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
