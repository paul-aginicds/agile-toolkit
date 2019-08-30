//

import UIKit
import SceneKit




class SplashViewController: UIViewController {
    
    let CategoryTree = 2
    
    var sceneView:SCNView!
    var scene:SCNScene!
    
    var ballNode:SCNNode!
    var selfieStickNode:SCNNode!
    
    var motion = MotionHelper()
    var motionForce = SCNVector3(0, 0, 0)
    
    
    override func viewDidLoad() {

        setupScene()
        setupNodes()
<<<<<<< HEAD
=======
    
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
    }
    
    
    func setupScene(){
        sceneView = (self.view as! SCNView)
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        
        sceneView.allowsCameraControl = true
<<<<<<< HEAD
        sceneView.showsStatistics = true
        scene = SCNScene(named: "art.scnassets/SplashScene.scn")
=======
        scene = SCNScene(named: "art.scnassets/StartScene.scn")
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
        sceneView.scene = scene
        
        scene.physicsWorld.contactDelegate = self
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        
        tapRecognizer.addTarget(self, action: #selector(GameViewController.sceneViewTapped(recognizer:)))
        sceneView.addGestureRecognizer(tapRecognizer)
<<<<<<< HEAD

=======
        
>>>>>>> 8dbabb13022637a3b73fd3787f5eb9f73acef208
    }
    
    func setupNodes() {
        ballNode = scene.rootNode.childNode(withName: "ball", recursively: true)!
        ballNode.physicsBody?.contactTestBitMask = CategoryTree
        selfieStickNode = scene.rootNode.childNode(withName: "selfieStick", recursively: true)!
    }
    
    @objc func sceneViewTapped (recognizer:UITapGestureRecognizer) {
        
        viewDidLoad()  // ...tap ball restarts the screen, the rest is ignored
        
        let location = recognizer.location(in: sceneView)
        
        let hitResults = sceneView.hitTest(location, options: nil)
        
        if hitResults.count > 0 {
            let result = hitResults.first
            if let node = result?.node {
                if node.name == "ball" {
                    ballNode.physicsBody?.applyForce(SCNVector3(x: 0, y:5, z: -2), asImpulse: true)
                }
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}

extension SplashViewController : SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        let ball = ballNode.presentation
        let ballPosition = ball.position
        
        let targetPosition = SCNVector3(x: ballPosition.x, y: ballPosition.y + 5, z:ballPosition.z + 5)
        var cameraPosition = selfieStickNode.position
        
        let camDamping:Float = 0.3
        
        let xComponent = cameraPosition.x * (1 - camDamping) + targetPosition.x * camDamping
        let yComponent = cameraPosition.y * (1 - camDamping) + targetPosition.y * camDamping
        let zComponent = cameraPosition.z * (1 - camDamping) + targetPosition.z * camDamping
        
        cameraPosition = SCNVector3(x: xComponent, y: yComponent, z: zComponent)
        //selfieStickNode.position = cameraPosition
        
        motion.getAccelerometerData { (x, y, z) in
            self.motionForce = SCNVector3(x: x * 0.05, y:0, z: (y + 0.8) * -0.08)
        }
        
        ballNode.physicsBody?.velocity += motionForce
    }

}

extension SplashViewController : SCNPhysicsContactDelegate {
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        var contactNode:SCNNode!
        
        if contact.nodeA.name == "ball" {
            contactNode = contact.nodeB
        }else{
            contactNode = contact.nodeA
        }
        
        if contactNode.physicsBody?.categoryBitMask == 1 {
            contactNode.isHidden = true
            
            let waitAction = SCNAction.wait(duration: 15)
            let unhideAction = SCNAction.run { (node) in
                node.isHidden = false
            }
            
            let actionSequence = SCNAction.sequence([waitAction, unhideAction])
            
            contactNode.runAction(actionSequence)
        }
        
    }
    
}
