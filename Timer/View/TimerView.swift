//
//  TimerView.swift
//  Timer
//
//  Created by Manikandan P on 07/03/19.
//  Copyright © 2019 Manikandan P. All rights reserved.
//

import Foundation
import UIKit

class TimerView : UIView {
    
    var timerLabel: UILabel = {
        var timerLabel = UILabel()
        timerLabel.text = "00:00:00"
        timerLabel.layer.masksToBounds = true
        timerLabel.textColor = .blue
        timerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 50)
        return timerLabel
    }()
    
    var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play.png"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    var pauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pause.png"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    var stopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "stop.png"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    init() {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .red
        layer.cornerRadius = 10
        settingSubView()
    }
    
    func settingSubView() {
        setupTimerLabel()
        setupPlayButton()
        setupPauseButton()
        setupStopButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTimerLabel() {
        addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setupPlayButton() {
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 50).isActive = true
        playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    func setupPauseButton() {
        addSubview(pauseButton)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 50).isActive = true
        pauseButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 20).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    func setupStopButton() {
        addSubview(stopButton)
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 50).isActive = true
        stopButton.leadingAnchor.constraint(equalTo: pauseButton.trailingAnchor, constant: 20).isActive = true
        stopButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 50).isActive = true
        stopButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        stopButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
}

class TimerView2 : UIView {
    
    init() {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        testLabelConstraints()
    }
    
    let testLabel:UILabel = {
        var label = UILabel()
        label.text = "TEst View 2"
        label.textColor = .red
        return label
    }()
    
    func testLabelConstraints() {
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(testLabel)
        testLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        testLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
