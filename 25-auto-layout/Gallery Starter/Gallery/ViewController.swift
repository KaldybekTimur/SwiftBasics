import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func buttonTapped(_ sender: UIButton) {
    if sender.title(for: .normal) == "X" {
      sender.setTitle("A very long title for this button", for: .normal)
    } else {
      sender.setTitle("X", for: .normal)
    }
  }  
  
}
