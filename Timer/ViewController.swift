//
//  ViewController.swift
//  Timer
//
//  Created by Manikandan P on 07/03/19.
//  Copyright © 2019 Manikandan P. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // store lap value to display the tableview
    var lapValue = [String]()
    
    // needed variable
    var seconds = 0
    var timer = Timer()
    var timerIsRunnig = false
    var resumeTapped = false
    
    // Connection to storyBoard
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!

    @IBOutlet weak var labelUIView: UIView!
    
    @IBOutlet weak var lapTabelView: UITableView!
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if timerIsRunnig == false {
            runTimer()
        }
    }
    
    
    // config table view to display the lapvalue to cell
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath)
        cell.textLabel?.text = lapValue[indexPath.row]
        return cell
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if resumeTapped == false {
            pauseButton.setBackgroundImage(UIImage(named: "replay"), for: UIControl.State.normal)
            timer.invalidate()
            self.resumeTapped = true
        } else {
            pauseButton.setBackgroundImage(UIImage(named: "pause"), for: UIControl.State.normal)
            runTimer()
            resumeTapped = false
        }
    }
    
    
    @IBAction func stopButtonStopped(_ sender: Any) {
        lapValue.removeAll()
        lapTabelView.reloadData()
        timer.invalidate()
        seconds = 0
        timeLabel.textColor = .white
        timeLabel.text = timeString(time: TimeInterval(seconds))
        timerIsRunnig = false
    }
    
    // Formatting Hours, Minutes, Seconds
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    // laptime
    
    @IBAction func lapButton(_ sender: Any) {
        lapValue.append(timeLabel.text ?? "00")
        print(lapValue)
        lapTabelView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lapTabelView.dataSource = self
        lapTabelView.backgroundColor = .gray
//        lapTabelView.delegate = self as! UITableViewDelegate
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        timerIsRunnig = true
    }
    
    @objc func updateTimer() {
        if seconds >= 30 {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: labelUIView.center.x - 10, y: labelUIView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: labelUIView.center.x + 10, y: labelUIView.center.y))
            
            labelUIView.layer.add(animation, forKey: "position")
            timeLabel.textColor = .red
            seconds += 1
            timeLabel.text = timeString(time: TimeInterval(seconds))
        } else {
            seconds += 1
            timeLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
}
