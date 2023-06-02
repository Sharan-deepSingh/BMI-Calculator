//
//  ViewController.swift
//  BMI Calculator
//
//  Created by user on 31/05/23.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculator = BMIBrain()
    

    @IBAction func heightSliderMoved(_ sender: UISlider) {
        let selectedHeight = sender.value
        heightLabel.text = "\(round(selectedHeight*100) / 100)m"
    }
    
    
    @IBAction func weightSliderMoved(_ sender: UISlider) {
        let selectedWeight = sender.value
        weightLabel.text = "\(round(selectedWeight*1000) / 1000)Kg"
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculator.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.bmiValue = calculator.giveBMI()
        destinationVC.adviceText = calculator.giveAdvide()
        destinationVC.color = calculator.giveColor()
    }
}

