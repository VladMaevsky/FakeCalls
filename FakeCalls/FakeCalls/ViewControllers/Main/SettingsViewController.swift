//
//  SettingsViewController.swift
//  FakeCalls
//
//  Created by Vlad Maevsky on 27.09.21.
//

import UIKit
import SafariServices
import StoreKit

class SettingsViewController: UIViewController {

    let settingItemsStrings = ["Help", "Terms of Use", "Privacy Policy", "Share the App", "Rate the App", "About us", "Subscribe"]
    let settingImages = ["ic_help", "ic_terms", "ic_privacyPolicy", "ic_shareApp", "ic_rateApp", "ic_aboutUs", "ic_subscribe"]
    
    @IBOutlet var settingsTableView: UITableView!
    
    func openUrl(urlStr: String!) {
        let safariVC = SFSafariViewController(url: URL(string: urlStr)!)
        present(safariVC, animated: true, completion: nil)
    }
    
    func shareButtonPressed() {
        //Set the default sharing message.
        let message = "Do you wnat to prank your friends? Try Fake Call!"
        //Set the link to share.
        if let link = NSURL(string: "https://apps.apple.com/app/id1578937932")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop,
                                                UIActivity.ActivityType.addToReadingList,
                                                UIActivity.ActivityType.copyToPasteboard,
                                                UIActivity.ActivityType.message,
                                                UIActivity.ActivityType.mail,
                                                UIActivity.ActivityType.postToFacebook,
                                                UIActivity.ActivityType.postToTwitter,
                                                UIActivity.ActivityType.print]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
//MARK: - @IBActions
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}

// MARK: - UITableViewController
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItemsStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell")!
        
        cell.textLabel?.text = settingItemsStrings[indexPath.row]
        cell.imageView?.image = UIImage(named: settingImages[indexPath.row])
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: openUrl(urlStr: helpURLString)
        case 1: openUrl(urlStr: termsURLString)
        case 2: openUrl(urlStr: privacyURLString)
        case 3: shareButtonPressed()
        case 4: SKStoreReviewController.requestReview()
        case 5: openUrl(urlStr: helpURLString)
//        case 6: To subscription
        default:
            print("error: No such button!")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
