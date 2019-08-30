//

import UIKit

class PlanningSizeViewController: UIViewController {
    
    var size:String = ""
    var pokerImage:String = ""
    var revealed:Bool = false
    var cardImages: [UIImage] = []
    var animate:Bool = true
    
    @IBOutlet weak var animateSwitch: UISwitch!
    
    @IBOutlet weak var sizeButton: UIButton!
    
    @IBAction func onCloseButton(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func reveal(_ sender: Any) {
        
        if (revealed) {
            revealed = false
            sizeButton.setImage(UIImage(named: "poker-rear.png"), for: .normal)
        } else {
            if (animateSwitch.isOn) {
                animate(imageView: sizeButton.imageView!, images: cardImages)
            }
            revealed = true
            sizeButton.setImage(UIImage(named: "poker-"+size+".png"), for: .normal)
        }
        sizeButton.setTitle(size, for: .normal)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        cardImages = createImageArray()
    }
    
    func createImageArray() -> [UIImage] {
        
        var imageArray: [UIImage] = []
        let pokerSizes = ["0","1","2","3","5","8","13","20","40","100","?","☕️"]
        
        for size in pokerSizes {
            imageArray.append(UIImage(named: "poker-"+size+".png")!)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
