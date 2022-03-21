//
//  BaseScreen.swift
//  AnimeFightNCenterFinished
//
//  Created by Özgün Yildiz on 21.03.22.
//

import UIKit

class BaseScreen: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height/2
        chooseButton.addTarget(self, action: #selector(goToSelection), for: .touchUpInside)
        
        // Step 2: Register the BaseScreen as the observer of the notifications. Depending on which notification it receives, it fires either setToGoku or setToSaitama
        
        NotificationCenter.default.addObserver(self, selector: #selector(setToGoku(_:)), name: .dragonballNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setToSaitama(_:)), name: .onepunchmanNotification, object: nil)
    }
    
    @objc func goToSelection() {
        let vc = storyboard?.instantiateViewController(withIdentifier: Constants.SELCTION_SCREEN) as! SelectionScreen
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    // Step 4: nBaseScreen has been notified by SelectionScreen and shoots off depending on the input of either setToGoku or setToSaitama
    
    @objc func setToGoku(_ notification: Notification) {
        guard let name = notification.userInfo?[Constants.NotificationCenter.NS_GOKUNAME] as? String, let image = notification.userInfo?[Constants.NotificationCenter.NS_GOKUIMAGE] as? UIImage, let color = notification.userInfo?[Constants.NotificationCenter.NS_GOKUCOLOR] as? UIColor else { return }
        
        // Step 5: UI update
        updateView(name: name, image: image, color: color)
    }
    
    @objc func setToSaitama(_ notification: Notification) {
        guard let name = notification.userInfo?[Constants.NotificationCenter.NS_SAITAMANAME] as? String, let image = notification.userInfo?[Constants.NotificationCenter.NS_SAITAMAIMAGE] as? UIImage, let color = notification.userInfo?[Constants.NotificationCenter.NS_SAITAMACOLOR] as? UIColor else { return }
        
        updateView(name: name, image: image, color: color)
    }
    
    func updateView(name: String, image: UIImage, color: UIColor) {
        self.nameLabel.text = name
        self.mainImageView.image = image
        self.view.backgroundColor = color
    }
}

// Step 1. Give the notification a name

extension Notification.Name {
    static let dragonballNotification = Notification.Name(Constants.Notifications.DBZ_NOTIFICATION)
    static let onepunchmanNotification = Notification.Name(Constants.Notifications.OPM_NOTIFICATION)
}



