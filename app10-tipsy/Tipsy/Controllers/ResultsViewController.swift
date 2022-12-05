import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson: Float = 0.0
    var tip: Float = 0.1
    var nPeople: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsLabel.text = String(format: "Split between %d people, with %d%% tip.", nPeople, Int(tip * 100))
        totalLabel.text = String(format: "%.2f", totalPerPerson)
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
