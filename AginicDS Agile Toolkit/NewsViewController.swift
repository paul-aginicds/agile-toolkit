//

import WebKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = URL(string: "http://www.aginicds.com/our-stories/")
        
        let request = URLRequest(url: url!)
        
        webview.loadRequest(request)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

