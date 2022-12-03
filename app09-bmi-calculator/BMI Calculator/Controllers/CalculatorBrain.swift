import Foundation

struct CalculatorBrain {
    
    var bmiResult: BmiResult?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmiResult = BmiResult(value: bmiValue, advice: "Eat more Pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmiResult = BmiResult(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmiResult = BmiResult(value: bmiValue, advice: "Eat less Pies!", color: .red)
        }
    }
    
    func getBmiResult() -> BmiResult? {
        return bmiResult
    }
    
}
 
