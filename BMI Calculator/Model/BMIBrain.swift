//
//  BMIBrain.swift
//  BMI Calculator
//
//  Created by user on 02/06/23.
//

import UIKit


struct BMIBrain {
    var bmiData: BMIData?
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        var bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmiData = BMIData(bmi: bmiValue, advice: "Eat more Pies", color: UIColor.systemBlue)
        }
        else if bmiValue < 24.9 {
            bmiData = BMIData(bmi: bmiValue, advice: "You are fit", color: UIColor.systemGreen)
        }
        else {
            bmiData = BMIData(bmi: bmiValue, advice: "Eat less pies", color: UIColor.systemRed)
        }
    }
    
    
    func giveBMI() -> String {
        return String(format: "%.1f", bmiData?.bmi ?? 0.0)
    }
    
    
    func giveAdvide () -> String {
        return bmiData?.advice ?? "No advice"
    }
    
    
    func giveColor () -> UIColor {
        return bmiData?.color ?? UIColor.white
    }
}



