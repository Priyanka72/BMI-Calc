//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightOutlet: UILabel!
    @IBOutlet weak var weightOutlet: UILabel!
  
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderPressed(_ sender: UISlider) {
        heightOutlet.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderPressed(_ sender: UISlider) {
        weightOutlet.text = String(format: "%.0fkg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        //print(bmi)
        // bmiValue = String(format: "%.1f", bmi)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        // let secondVC = SecondViewController()
        // secondVC.bmiVal = String(format: "%.1f", bmi)
        // self.present(secondVC, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.backgroundCol = calculatorBrain.getColor()
        }
    }
}

