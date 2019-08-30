//

import UIKit
import SceneKit
import AudioToolbox

class GameViewController: UIViewController {
    
    let CategoryTree = 2

    var score:Int = 0
    var timeCount:Float = 0

    var sceneView:SCNView!
    var scene:SCNScene!
    
    var ballNode:SCNNode!
    var selfieStickNode:SCNNode!

    var scoreNode:SCNNode!
    var timeNode:SCNNode!

    var motion = MotionHelper()
    var motionForce = SCNVector3(0, 0, 0)
    
    var sounds:[String:SCNAudioSource] = [:]
    
    
    override func viewDidLoad() {
        score = 0
        timeCount = 0
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(fire), userInfo: nil, repeats: true)

        setupScene()
        setupNodes()
        setupSounds()
    }
    
    
    @objc func fire()
    {
        timeCount = timeCount + 0.01
    }
    
    func setupScene(){
        sceneView = (self.view as! SCNView)
        sceneView.delegate = self
        
        //sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
        
        scene = SCNScene(named: "art.scnassets/MainScene.scn")
        sceneView.scene = scene
        
        scene.physicsWorld.contactDelegate = self
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        
        tapRecognizer.addTarget(self, action: #selector(GameViewController.sceneViewTapped(recognizer:)))
        sceneView.addGestureRecognizer(tapRecognizer)
        
    }
    
    func setupNodes() {
        ballNode = scene.rootNode.childNode(withName: "ball", recursively: true)!
        ballNode.physicsBody?.contactTestBitMask = CategoryTree
        selfieStickNode = scene.rootNode.childNode(withName: "selfieStick", recursively: true)!
        scoreNode = scene.rootNode.childNode(withName: "scoreNode", recursively: true)!
        timeNode = scene.rootNode.childNode(withName: "timeNode", recursively: true)!
    }
    
    func setupSounds() {
        let sawSound = SCNAudioSource(fileNamed: "chainsaw.wav")!
        let jumpSound = SCNAudioSource(fileNamed: "jump.wav")!
        sawSound.load()
        jumpSound.load()
        sawSound.volume = 0.3
        jumpSound.volume = 0.4
        
        sounds["saw"] = sawSound
        sounds["jump"] = jumpSound
        
        let backgroundMusic = SCNAudioSource(fileNamed: "background.mp3")!
        backgroundMusic.volume = 0.1
        backgroundMusic.loops = true
        backgroundMusic.load()
        
        let musicPlayer = SCNAudioPlayer(source: backgroundMusic)
        ballNode.addAudioPlayer(musicPlayer)
        
    }
    
    @objc func sceneViewTapped (recognizer:UITapGestureRecognizer) {
        
        //viewDidLoad()  // ...tap ball restarts the screen,
        
        let location = recognizer.location(in: sceneView)
        
        let hitResults = sceneView.hitTest(location, options: nil)
        
        if hitResults.count > 0 {
            let result = hitResults.first
            if let node = result?.node {
                if node.name == "ball" {
                    let jumpSound = sounds["jump"]!
                    ballNode.runAction(SCNAction.playAudio(jumpSound, waitForCompletion: false))
                    ballNode.physicsBody?.applyForce(SCNVector3(x: 0, y:4, z: -2), asImpulse: true)
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

extension GameViewController : SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        let ball = ballNode.presentation
        let ballPosition = ball.position
        
        let targetPosition = SCNVector3(x: ballPosition.x, y: ballPosition.y + 5, z:ballPosition.z + 5)
        var cameraPosition = selfieStickNode.position
        var scorePosition = selfieStickNode.position
        var timePosition = selfieStickNode.position
        
        let camDamping:Float = 0.1
        
        let xComponent = cameraPosition.x * (1 - camDamping) + targetPosition.x * camDamping
        let yComponent = cameraPosition.y * (1 - camDamping) + targetPosition.y * camDamping
        let zComponent = cameraPosition.z * (1 - camDamping) + targetPosition.z * camDamping
        
        cameraPosition = SCNVector3(x: xComponent, y: yComponent, z: zComponent)
        scorePosition = SCNVector3(x: xComponent - 2.1, y: yComponent - 3, z: zComponent + 3)
        timePosition = SCNVector3(x: xComponent + 1.4, y: yComponent - 3, z: zComponent + 3)

        selfieStickNode.position = cameraPosition
        
        scoreNode.position = scorePosition
        timeNode.position = timePosition

        if let textGeometry = scoreNode.geometry as? SCNText {
            textGeometry.string = String(score)
        }
        if let timeGeometry = timeNode.geometry as? SCNText {
            timeGeometry.string = String(round(1000*timeCount)/1000)
        }

        motion.getAccelerometerData { (x, y, z) in
            self.motionForce = SCNVector3(x: x * 0.2, y:0, z: (y + 0.8) * -0.05)
        }
        
        ballNode.physicsBody?.velocity += motionForce
    }
    
}

extension GameViewController : SCNPhysicsContactDelegate {
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        var contactNode:SCNNode!
        
        if contact.nodeA.name == "ball" {
            contactNode = contact.nodeB
        }else{
            contactNode = contact.nodeA
        }

        if contactNode.physicsBody?.categoryBitMask == 6 {
            contactNode.isHidden = true
            
            self.viewDidLoad()
            
        }
        
        if contactNode.physicsBody?.categoryBitMask == 7 {
            self.score = self.score - 10
            contactNode.isHidden = true
        }

        if contactNode.physicsBody?.categoryBitMask == 4 {
            contactNode.isHidden = true
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            _ = SCNAction.wait(duration: 1)
            _ = SCNAction.run { (node) in
                self.score = self.score - 1
            }
            
            let sawSound = sounds["saw"]!
            ballNode.runAction(SCNAction.playAudio(sawSound, waitForCompletion: false))
            
            let waitAction = SCNAction.wait(duration: 3)
            let unhideAction = SCNAction.run { (node) in
                node.isHidden = false
            }
            
            let actionSequence = SCNAction.sequence([waitAction, unhideAction])
            
            contactNode.runAction(actionSequence)
        }
        
        if contactNode.physicsBody?.categoryBitMask == 3 {
            contactNode.isHidden = true
            
            score = score + 10
            
            let sawSound = sounds["jump"]!
            ballNode.runAction(SCNAction.playAudio(sawSound, waitForCompletion: false))
            
            let waitAction = SCNAction.wait(duration: 3)
            let unhideAction = SCNAction.run { (node) in
                node.isHidden = false
            }
            
            let actionSequence = SCNAction.sequence([waitAction, unhideAction])
            
            contactNode.runAction(actionSequence)
        }

        if contactNode.physicsBody?.categoryBitMask == CategoryTree {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

            score = score - 1
            
            let waitAction = SCNAction.wait(duration: 3)
            let unhideAction = SCNAction.run { (node) in
                node.isHidden = false
            }
            
            let actionSequence = SCNAction.sequence([waitAction, unhideAction])
            
            contactNode.runAction(actionSequence)
        }
        
    }
    
}
