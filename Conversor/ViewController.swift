//
//  ViewController.swift
//  Conversor
//
//  Created by Pablo Rosalvo on 10/01/19.
//  Copyright © 2019 Pablo Rosalvo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var celsiusButton: UIButton!
    @IBOutlet weak var farenheintButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultUnitLabel: UILabel!
    @IBOutlet weak var labelUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showNextAction(_ sender: UIButton) {
        switch labelUnit.text {
        case "Temperatura":
            labelUnit.text = "Peso"
            celsiusButton.setTitle("Kilograma", for: .normal)
            farenheintButton.setTitle("Libra", for: .normal)
        case "Peso":
            labelUnit.text = "Moeda"
            celsiusButton.setTitle("Real", for: .normal)
            farenheintButton.setTitle("Dolar", for: .normal)
        case "Moeda" :
            labelUnit.text = "Distancia"
            celsiusButton.setTitle("Metro", for: .normal)
            farenheintButton.setTitle("Kilometro", for: .normal)
        default:
            labelUnit.text = "Temperatura"
            celsiusButton.setTitle("Celsius", for: .normal)
            farenheintButton.setTitle("Farenheit", for: .normal)
        }
        convertCelsius(nil)
    }
    
    @IBAction func convertCelsius(_ sender: UIButton?) {
        if let sender = sender {
            if sender == celsiusButton {
                farenheintButton.alpha  = 0.5
               
            } else {
                celsiusButton.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch labelUnit.text! {
            case "Temperatura":
                caculateTemperature()
            case "Peso":
                caculateWeigth()
            case "Moeda" :
                caculateCurrency()
            default:
                caculateDistance()
        }
    }
    
    func caculateTemperature() {
        guard let temperature = Double(valueTextField.text!) else {return}
        if celsiusButton.alpha == 1.0 {
            resultUnitLabel.text = "Farenheint"
            resultLabel.text = String(temperature * 1.8 + 32.0)
        } else {
            resultUnitLabel.text = "Celsius"
            resultLabel.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func caculateWeigth() {
        guard let weigth = Double(valueTextField.text!) else {return}
        if celsiusButton.alpha == 1.0 {
            resultUnitLabel.text = "Libra"
            resultLabel.text = String(weigth / 2.2046)
        } else {
            resultUnitLabel.text = "Kilograma"
            resultLabel.text = String(weigth * 2.2046)
        }
    }
    
    func caculateCurrency() {
        guard let currency = Double(valueTextField.text!) else {return}
        if celsiusButton.alpha == 1.0 {
            resultUnitLabel.text = "Dolar"
            resultLabel.text = String(currency / 3.5)
        } else {
            resultUnitLabel.text = "real"
            resultLabel.text = String(currency * 3.5)
        }
    }
    
    func caculateDistance() {
        guard let distance = Double(valueTextField.text!) else {return}
        if celsiusButton.alpha == 1.0 {
            resultUnitLabel.text = "Kilometro"
            resultLabel.text = String(distance / 1000)
        } else {
            resultUnitLabel.text = "Metros"
            resultLabel.text = String(distance * 1000)
        }
    }
}

