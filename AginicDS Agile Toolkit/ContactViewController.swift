//

import UIKit
import WebKit

class ContactViewController: UIViewController, WKNavigationDelegate {
    
<<<<<<< HEAD
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string: "https://aginic.com/contact/")!
        
        webView.load(URLRequest(url: url))
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
=======
    //@IBOutlet weak var webview: UIWebView!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        let url = URL(string: "https://aginic.com/contact/")!
        
        webView.load(URLRequest(url: url))
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        webView.allowsBackForwardNavigationGestures = true
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
        
        webView.allowsBackForwardNavigationGestures = true
    }

    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
<<<<<<< HEAD
    //TODO: note - experiment with loading progress bars...
=======
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(Float(webView.estimatedProgress))
        }
    }

<<<<<<< HEAD
=======

>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

