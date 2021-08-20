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
    
    private var lights = CurrentLights.red
    /* Here we add two private constants for lights on and off, that is the same as red.light.alpha = 0.3, but better for code reading. CGFloat is how alpha is measured. Besides, we use private here because of incapsulation rules*/
    private let lightOff: CGFloat = 0.3
    private let lightOn: CGFloat = 1
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightOff
        yellowLight.alpha = lightOff
        greenLight.alpha = lightOff
        
        redLight.backgroundColor = #colorLiteral(red: 0.6643349528, green: 0, blue: 0.08385483176, alpha: 1)
        yellowLight.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        greenLight.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        startButton.layer.cornerRadius = 10
    }
    /* Here we use additional override func, because if we put the method for making circles in viewdidload it will count only for the initial size, and now it changes according to the model loaded. Actually, this method means that everything in it will take place only after all views are updated, bounds changed and rotated.
     Also it is used because we used active constraints, if they were static and fixed we could set the concrete number(50 in my case)
     In greenLight I used height just to show that therer is no difference, because height = width*/
    override func viewDidLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }
    
    //MARK: - IB Actions
    @IBAction func showLightsStartButton() {
        
        startButton.setTitle("Next", for: .normal)
        
        switch lights {
        case .red:
            redLight.alpha = lightOn
            yellowLight.alpha = lightOff
            greenLight.alpha = lightOff
            lights = .yellow
    
        case .yellow:
            redLight.alpha = lightOff
            yellowLight.alpha = lightOn
            greenLight.alpha = lightOff
            lights = .green
            
        case .green:
            redLight.alpha = lightOff
            yellowLight.alpha = lightOff
            greenLight.alpha = lightOn
            lights = .red
        }
    }
}

