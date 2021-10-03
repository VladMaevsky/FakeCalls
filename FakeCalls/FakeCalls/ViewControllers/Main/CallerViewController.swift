//
//  CallerViewController.swift
//  FakeCalls
//
//  Created by Vlad Maevsky on 2.10.21.
//

import UIKit

class CallerViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitleLabel()
    }
    
    //MARK: - Methods
    func setupTitleLabel() {
        let attributedString1 = NSMutableAttributedString(string: "Caller", attributes:[.font: UIFont(name: "HKGrotesk-ExtraBold", size: 20)!])
        let attributedString2 = NSAttributedString(string: " settings", attributes:[.font: UIFont(name: "HKGrotesk-ExtraBold", size: 20)!, .foregroundColor: mainBlueColor])
        attributedString1.append(attributedString2)
        titleLabel.attributedText = attributedString1
    }
}
