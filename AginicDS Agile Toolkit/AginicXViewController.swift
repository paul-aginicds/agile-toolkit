//

import WebKit

class AginicXViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://www.aginic.com/cloud-technologies/")
        
        let request = URLRequest(url: url!)
        
        webview.loadRequest(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
