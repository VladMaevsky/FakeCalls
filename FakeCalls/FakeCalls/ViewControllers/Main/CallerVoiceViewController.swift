//
//  CallerVoiceViewController.swift
//  FakeCalls
//
//  Created by Vlad Maevsky on 2.10.21.
//

import UIKit

class CallerVoiceViewController: UIViewController {

    let voices = ["None", "People Talking", "Hello Thai", "Minions Banana", "Hi Sweetheart"]
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitleLabel()
    }
    
    //MARK: - Methods
    func setupTitleLabel() {
        let attributedString1 = NSMutableAttributedString(string: "Caller voice", attributes:[.font: UIFont(name: "HKGrotesk-ExtraBold", size: 20)!])
        let attributedString2 = NSAttributedString(string: " settings", attributes:[.font: UIFont(name: "HKGrotesk-ExtraBold", size: 20)!, .foregroundColor: mainBlueColor])
        attributedString1.append(attributedString2)
        titleLabel.attributedText = attributedString1
    }
}

// MARK: - UITableViewDataSource
extension CallerVoiceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoiceTableViewCell")!
        
        cell.textLabel?.text = voices[indexPath.row]
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CallerVoiceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    
}
