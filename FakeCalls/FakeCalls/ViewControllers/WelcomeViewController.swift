//
//  ViewController.swift
//  FakeCalls
//
//  Created by Vlad Maevsky on 19.09.21.
//

import UIKit
import ApphudSDK

class WelcomeViewController: BackgroundImageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Add method for getting subscription status
        
        getPaywalls()
    }
}

private extension WelcomeViewController {
    func getPaywalls() {
        // TODO: Add getting paywalls functionality
        
        DispatchQueue.main.async {
            if LandscapeManager.shared.isNotFirstLaunch {
                self.toMain()
            } else {
                self.toOnboarding()
            }
        }
    }
    
    func toMain() {
        self.performSegue(withIdentifier: "toMain", sender: nil)
    }
    
    func toOnboarding() {
        self.performSegue(withIdentifier: "toOnboarding", sender: nil)
    }
}
