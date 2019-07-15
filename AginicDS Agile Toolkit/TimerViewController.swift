//
//  TimerViewController
//  AginicDS Agile Toolkit
//
//  Created by Paul Thornton on 06/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import WebKit
import AudioToolbox.AudioServices

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var vibrate: UISwitch!
    
    var countdownTimer: Timer!
    var totalTime = 60

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
    }
    
    func startTimer() {
        startButton.isEnabled = false
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
            startButton.isEnabled = true
        }
        if vibrate.isOn {
            if totalTime <= 10 {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
        }
    }
    
    func endTimer() {
        
        if countdownTimer != nil {
        
            if countdownTimer.isValid {
                countdownTimer.invalidate()
            }
        }
        startButton.isEnabled = true
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func setOneMins(_ sender: Any) {
        endTimer()
        totalTime = 60
        startTimer()
    }
    
    @IBAction func setTenMins(_ sender: Any) {
        endTimer()
        totalTime = 600
        startTimer()
    }
    
    @IBAction func set60Mins(_ sender: Any) {
        endTimer()
        totalTime = 3600
        startTimer()
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBAction func set15Mins(_ sender: Any) {
        
        endTimer()
        totalTime = 900
        startTimer()
    }
    
    @IBAction func set30Mins(_ sender: Any) {
        endTimer()
        totalTime = 1800
        startTimer()
    }
    
    @IBAction func setFiveMins(_ sender: Any) {
        endTimer()
        totalTime = 300
        startTimer()
    }
    @IBAction func setThreeMins(_ sender: Any) {
        endTimer()
        totalTime = 180
        startTimer()
    }
    @IBAction func startTimerPressed(_ sender: Any) {
        startTimer()
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        endTimer()
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

