import UIKit

// View controller class for the calculator functionality
class CalculatorViewController: UIViewController {
    // Outlets for UI elements
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // Variables to store tip, number of people, bill total, and final result
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    // Method called when tip percentage buttons are pressed
    @IBAction func tipChanged(_ sender: UIButton) {
        // Dismiss the keyboard
        billTextField.endEditing(true)
        
        // Deselect all tip percentage buttons and select the pressed one
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        // Extract tip percentage from button title
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100 // Convert to decimal

    }
    
    // Method called when stepper value changes (number of people)
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    // Method called when calculate button is pressed
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Get bill amount from text field and calculate total per person
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self) // Perform segue to show results
    }
    
    // Method to prepare data for passing to result view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult // Set total per person
            destinationVC.tip = Int(tip * 100) // Set tip percentage
            destinationVC.split = numberOfPeople // Set number of people
        }
    }
}
