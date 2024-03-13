import UIKit

// View controller class to display calculation results
class ResultsViewController: UIViewController {
    // Outlets for UI elements
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    // Variables to store result, tip percentage, and number of people
    var result = "0.0"
    var tip = 10
    var split = 2
    
    // Method called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set total per person and calculation settings labels
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."

    }
    
    // Method called when recalculate button is pressed
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // Dismiss the results view controller
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
