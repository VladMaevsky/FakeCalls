import UIKit

class MainViewController: UIViewController {
    
    private let timerFont = UIFont(name: "HKGrotesk-ExtraBold", size: 30)!
    private let timerFontSmall = UIFont(name: "HKGrotesk-SemiBold", size: 14)!
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var callerButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    private var pickerViewData = [String]()
    
    var hour = 0
    var minutes = 0
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...59 {
            pickerViewData.append(String(i))
        }
        
        setupTitleLabel()
        pickerView.selectRow(5, inComponent: 1, animated: true)
    }
    
    //MARK: - Methods
    func setupTitleLabel() {
        let attributedString1 = NSMutableAttributedString(string: "Timer", attributes:[.font: UIFont(name: "HKGrotesk-ExtraBold", size: 20)!])
        let attributedString2 = NSAttributedString(string: " settings", attributes:[.font: UIFont(name: "HKGrotesk-ExtraBold", size: 20)!, .foregroundColor: mainBlueColor])
        attributedString1.append(attributedString2)
        titleLabel.attributedText = attributedString1
    }
}

//MARK: - UIPickerViewDataSource
extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60
        default:
            return 0
        }
    }
}

//MARK: - UIPickerViewDelegate
extension MainViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width / 3
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.textAlignment = .center
        }
        
        switch component {
        case 0:
            let attributedString1 = NSMutableAttributedString(string: pickerViewData[row], attributes:[.font: timerFont])
            let attributedString2 = NSAttributedString(string: " hour", attributes:[.font: timerFontSmall])
            attributedString1.append(attributedString2)
            pickerLabel?.attributedText = attributedString1
        case 1:
            let attributedString1 = NSMutableAttributedString(string: pickerViewData[row], attributes:[.font: timerFont])
            let attributedString2 = NSAttributedString(string: " min", attributes:[.font: timerFontSmall])
            attributedString1.append(attributedString2)
            pickerLabel?.attributedText = attributedString1
        case 2:
            let attributedString1 = NSMutableAttributedString(string: pickerViewData[row], attributes:[.font: timerFont])
            let attributedString2 = NSAttributedString(string: " sec", attributes:[.font: timerFontSmall])
            attributedString1.append(attributedString2)
            pickerLabel?.attributedText = attributedString1
        default:
            pickerLabel?.text = ""
        }
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
        }
    }
}
