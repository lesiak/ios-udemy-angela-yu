
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiResult: BmiResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let bmi = bmiResult {
            bmiLabel.text = String(format: "%.1f",  bmi.value)
            adviceLabel.text = bmi.advice
            view.backgroundColor = bmi.color
        }
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
