//

import WebKit

class AginicXViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
        let url = URL(string: "http://www.aginic.com/cloud-technologies/")
=======
        let url = URL(string: "https://aginic.com/cloud-technologies/")
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
        
        let request = URLRequest(url: url!)
        
        webview.loadRequest(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
