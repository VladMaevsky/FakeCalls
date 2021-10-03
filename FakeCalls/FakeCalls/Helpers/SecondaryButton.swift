//
//  SecondaryButton.swift
//  FakeCalls
//
//  Created by Vlad Maevsky on 1.10.21.
//

import UIKit

class SecondaryButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.bounds.height / 2
        backgroundColor = UIColor(named: "ic_mainBlueColor")
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "HKGrotesk-SemiBold", size: 14)
    }
}
