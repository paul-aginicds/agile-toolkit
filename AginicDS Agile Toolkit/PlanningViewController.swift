//

import UIKit


class PlanningViewController: UIViewController {
    
    var s:String = ""
    var cardImages: [UIImage] = []
    var pokerDeck: [PokerDeck] = []
    
    
    @IBOutlet weak var pokerBtn0: UIButton!
    @IBOutlet weak var pokerBtn1: UIButton!
    @IBOutlet weak var pokerBtn2: UIButton!
    @IBOutlet weak var pokerBtn3: UIButton!
    @IBOutlet weak var pokerBtn5: UIButton!
    @IBOutlet weak var pokerBtn8: UIButton!
    @IBOutlet weak var pokerBtn13: UIButton!
    @IBOutlet weak var pokerBtn20: UIButton!
    @IBOutlet weak var pokerBtn40: UIButton!
    @IBOutlet weak var pokerBtn100: UIButton!
    
    @IBOutlet weak var pokerBtnQ: UIButton!
    @IBOutlet weak var pokerBtnT: UIButton!
    
    @IBAction func didHitButton(_ sender: UIButton) {
        s = (sender.titleLabel?.text)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //self.prepDeck()
            self.resetDeck()
        }
    }

    @IBAction func refreshDeck(_ sender: Any) {
        reverseDeck()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.prepDeck()
            self.resetDeck()
        }
    }

    func prepDeck() {
        let btnArray: [UIButton] = [pokerBtn0,pokerBtn1,pokerBtn2,pokerBtn3,pokerBtn5,pokerBtn8,pokerBtn13,pokerBtn20,pokerBtn40,pokerBtn100,pokerBtnQ,pokerBtnT]
        
        for btn in btnArray {
            cardImages = createImageArray(shuffle: true)
            animate(imageView: btn.imageView!, images: cardImages)
        }
        
    }
    func resetDeck() {
        
        pokerDeck = [
            PokerDeck("0",pokerBtn0),
            PokerDeck("1",pokerBtn1),
            PokerDeck("2",pokerBtn2),
            PokerDeck("3",pokerBtn3),
            PokerDeck("5",pokerBtn5),
            PokerDeck("8",pokerBtn8),
            PokerDeck("13",pokerBtn13),
            PokerDeck("20",pokerBtn20),
            PokerDeck("40",pokerBtn40),
            PokerDeck("100",pokerBtn100),
            PokerDeck("?",pokerBtnQ),
            PokerDeck("☕️",pokerBtnT)
        ]
        
        for card in pokerDeck {
            card.btn.setImage(UIImage(named: "poker-"+card.size+".png")!, for: .normal)
        }
        
    }
    
    func reverseDeck() {
        
        for card in pokerDeck {
            card.btn.setImage(UIImage(named: "poker-rear.png")!, for: .normal)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PlanningSizeViewController
        {
            let vc = segue.destination as? PlanningSizeViewController
            vc?.size = s
        }
        
        if segue.destination is RetroDetailViewController
        {
            let vc = segue.destination as? RetroDetailViewController
            vc?.technique = "StoryPointing"
        }
    }
    
    func createImageArray(shuffle: Bool) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        var pokerSizes = ["0","1","2","3","5","8","13","20","40","100","?","☕️"]
        
        if (shuffle) {
            var shuffled = [String]()
        
            for _ in 0..<pokerSizes.count {
                let rand = Int(arc4random_uniform(UInt32(pokerSizes.count)))
                shuffled.append(pokerSizes[rand])
                pokerSizes.remove(at: rand)
            }
            pokerSizes = shuffled
        }

        var imageName:String = ""
        var image = UIImage(named: imageName)

        for size in pokerSizes {
            imageName = "poker-"+size+".png"
            print(imageName)
            image = UIImage(named: imageName)
            imageArray.append(image!)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 0.75
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }

}

struct PokerDeck {
    let size: String
    let btn: UIButton
    init(_ size: String, _ btn: UIButton) {
        self.size = size
        self.btn = btn
    }
}
