//
//  ViewController.swift
//  TrafficLights
//
//  Created by Dmitry Logachev on 17.08.2021.
//

import UIKit

enum CurrentLights {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    var lights = CurrentLights.red
    
    //MARK: - Override methods
    override func viewDidLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = 0.3
        yellowLight.alpha = 0.3
        greenLight.alpha = 0.3
        
        redLight.backgroundColor = #colorLiteral(red: 0.6643349528, green: 0, blue: 0.08385483176, alpha: 1)
        yellowLight.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        greenLight.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        startButton.layer.cornerRadius = 10
    }
    //MARK: - IB Actions
    @IBAction func showLightsStartButton() {
        
        startButton.setTitle("Next", for: .normal)
        
        
        switch lights {
        case .red:
            redLight.alpha = 1
            yellowLight.alpha = 0.3
            greenLight.alpha = 0.3
            lights = .yellow
    
        case .yellow:
            redLight.alpha = 0.3
            yellowLight.alpha = 1
            greenLight.alpha = 0.3
            lights = .green
            
        case .green:
            redLight.alpha = 0.3
            yellowLight.alpha = 0.3
            greenLight.alpha = 1
            lights = .red
           
        }
        
    }
}

