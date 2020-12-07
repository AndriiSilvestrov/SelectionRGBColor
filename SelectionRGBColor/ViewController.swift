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
    
    @IBOutlet var redInputField: UITextField!
    @IBOutlet var greenInputField: UITextField!
    @IBOutlet var blueInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redInputField.delegate = self
        greenInputField.delegate = self
        blueInputField.delegate = self
        
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
        
        setValueForInputField()
        setValueForLabel()
        setColor()
        
        addDoneButtonTo(redInputField)
        addDoneButtonTo(greenInputField)
        addDoneButtonTo(blueInputField)
    }
    
    override func viewWillLayoutSubviews() {
        colorScreen.layer.cornerRadius = colorScreen.frame.width / 20
    }

    @IBAction func redColorSetting() {
        setValueForInputField()
        setValueForLabel()
        setColor()
    }
    
    @IBAction func greenColorSetting() {
        setValueForInputField()
        setValueForLabel()
        setColor()
    }
    
    @IBAction func blueColorSetting() {
        setValueForInputField()
        setValueForLabel()
        setColor()
    }
    
    private func setColor() {
        colorScreen.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
    }
    
    private func setValueForLabel() {
        redCurrentValue.text = String(format: "%.2f", redSlider.value)
        greenCurrentValue.text = String(format: "%.2f", greenSlider.value)
        blueCurrentValue.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setValueForInputField() {
        redInputField.text = String(format: "%.2f", redSlider.value)
        greenInputField.text = String(format: "%.2f", greenSlider.value)
        blueInputField.text = String(format: "%.2f", blueSlider.value)
    }
}

extension ViewController: UITextFieldDelegate {
    
    //Скрываем клавиатуру нажатием на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) //Скрывает клавиатуру, вызваннкю для любого обьекта
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }

        if let currentValue = Float(text) {

            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
            
            setValueForInputField()
            setValueForLabel()
            setColor()
        } else {
            showAlert(title: "Wrong format", message: "Please enter correct value")
        }
    }
}

extension ViewController {
    
    //Методы для отображения кнопки "Готово" на цыфровой клавиатуре
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let dobeButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        keyboardToolbar.items = [flexBarButton, dobeButton]
    }
    
    @objc private func didTapDone(){
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
