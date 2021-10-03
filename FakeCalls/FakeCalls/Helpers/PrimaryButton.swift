//
//  PrimaryButton.swift
//  FakeCalls
//
//  Created by Vlad Maevsky on 21.09.21.
//

import UIKit

class PrimaryButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.bounds.height / 2
        backgroundColor = UIColor(named: "ic_mainBlueColor")
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "HKGrotesk-ExtraBold", size: 16)
    }

}
 
