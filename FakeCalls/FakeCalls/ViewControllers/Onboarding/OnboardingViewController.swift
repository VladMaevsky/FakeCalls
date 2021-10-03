import UIKit

class OnboardingViewController: BackgroundImageViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var closeButton: UIButton!
    
    enum OnBoardState {
        case first
        case second
        case third
        case subs
    }
    
    private var onBoardState: OnBoardState = .first
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.roundCorners(corners: .topLeft, radius: 100.0)
    }
    
    //MARK: - @IBActions
    @IBAction func continuePressed() {
        switch onBoardState {
        case .first:
            setupFirstTextLabel()
            subtitleLabel.text = "Simulate an incoming iPhone call"
            mainImage.image = UIImage(named: "ic_img1")
            continueButton.setTitle("Continue", for: .normal)
            closeButton.isHidden = true
            onBoardState = .second
            
        case .second:
            setupSecondTextLabel()
            subtitleLabel.text = "We constantly improve the application and\nit is important for us to know your opinion"
            mainImage.image = UIImage(named: "ic_img2")
            onBoardState = .third
        case .third:
            setupThirdTextLabel()
            subtitleLabel.text = "Set a timer to receive calls\nSelect a ringtone you like\nSelect caller's voice"
            mainImage.image = UIImage(named: "ic_img3")
            onBoardState = .subs
        case .subs:
            setupFourthTextLabel()
            subtitleLabel.text = "Unlimited access to Fake Call function\nBilled every 3 months at $49,99"
            mainImage.image = UIImage(named: "ic_img4")
            continueButton.setTitle("Continue & Subscribe", for: .normal)
            closeButton.isHidden = false
            onBoardState = .first
        }
    }
    
    @IBAction func linkPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: openUrl(urlStr: privacyURLString)
        case 1: openUrl(urlStr: termsURLString)
        default: print("Error. No such type of button!")
        }
    }
    
    @IBAction func restorePressed(_ sender: Any) {
        SubscriptionManager.shared.restoreSubscription { (isActiveSubs, string) in
            if isActiveSubs {
//                ConfigSingleton.shared.isActivedSubscription = isActiveSubs
                let center = UNUserNotificationCenter.current()
                center.removePendingNotificationRequests(withIdentifiers: ["PushID", "PushID2"])
//                self.toMain()
            } else {
                let alert = UIAlertController(title: nil, message: "No active subscriptions", preferredStyle: .alert)
                if #available(iOS 13.0, *) { alert.overrideUserInterfaceStyle = .dark }
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: -  Methods
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func setupFirstTextLabel() {
        let attributedString1 = NSMutableAttributedString(string: "The most ", attributes:[.font: defaultFont, .foregroundColor: mainBlueColor])
        let attributedString2 = NSMutableAttributedString(string: "lifelike fake call\n", attributes:[.font: defaultFont, .foregroundColor: UIColor.black])
        let attributedString3 = NSMutableAttributedString(string: "app is coming", attributes:[.font: defaultFont, .foregroundColor: mainBlueColor])

        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        titleLabel.attributedText = attributedString1
    }
    
    func setupSecondTextLabel() {
        let attributedString1 = NSMutableAttributedString(string: "We ", attributes:[.font: defaultFont, .foregroundColor: mainBlueColor])
        let attributedString2 = NSMutableAttributedString(string: "always evaluate\n", attributes:[.font: defaultFont, .foregroundColor: UIColor.black])
        let attributedString3 = NSMutableAttributedString(string: "your feedback", attributes:[.font: defaultFont, .foregroundColor: mainBlueColor])

        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        titleLabel.attributedText = attributedString1
    }
    
    func setupThirdTextLabel() {
        let attributedString1 = NSMutableAttributedString(string: "Simulate ", attributes:[.font: defaultFont, .foregroundColor: UIColor.black])
        let attributedString2 = NSMutableAttributedString(string: "an incoming call", attributes:[.font: defaultFont, .foregroundColor: mainBlueColor])

        attributedString1.append(attributedString2)
        
        titleLabel.attributedText = attributedString1
    }
    
    func setupFourthTextLabel() {
        let attributedString1 = NSMutableAttributedString(string: "PRO ", attributes:[.font: defaultFont, .foregroundColor: UIColor.black])
        let attributedString2 = NSMutableAttributedString(string: "Fake Call", attributes:[.font: defaultFont, .foregroundColor: mainBlueColor])

        attributedString1.append(attributedString2)
        
        titleLabel.attributedText = attributedString1
    }
}
