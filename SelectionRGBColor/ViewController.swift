//
//  ViewController.swift
//  SelectionRGBColor
//
//  Created by Andrey Silvestrov on 11/25/20.
//  Copyright © 2020 Andrey Silvestrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorScreen: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redCurrentValue: UILabel!
    @IBOutlet var greenCurrentValue: UILabel!
    @IBOutlet var blueCurrentValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 0.6
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.value = 0.2
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.value = 0.4
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .systemBlue
        
        redCurrentValue.text = String(format: "%.2f", redSlider.value)
        greenCurrentValue.text = String(format: "%.2f", greenSlider.value)
        blueCurrentValue.text = String(format: "%.2f", blueSlider.value)
        
        colorScreen.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    override func viewWillLayoutSubviews() {
        colorScreen.layer.cornerRadius = colorScreen.frame.width / 20
    }

    @IBAction func redColorSetting() {
        redCurrentValue.text = String(format: "%.2f", redSlider.value)
        colorScreen.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    @IBAction func greenColorSetting() {
        greenCurrentValue.text = String(format: "%.2f", greenSlider.value)
        colorScreen.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    @IBAction func blueColorSetting() {
        blueCurrentValue.text = String(format: "%.2f", blueSlider.value)
        colorScreen.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
}

