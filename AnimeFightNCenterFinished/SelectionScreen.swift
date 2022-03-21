//
//  SelectionScreen.swift
//  AnimeFightNCenterFinished
//
//  Created by Özgün Yildiz on 21.03.22.
//

import Foundation

import UIKit

class SelectionScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Step 3: If one of these buttons is pressed, it will fire up a notification to the observer. The observer being the BaseScreen, will then subsequently fire a function
    
    @IBAction func dbzTapped(_ sender: UIButton) {
        let name = Constants.SON_GOKU
        let image = UIImage(named: Constants.SON_GOKU_IMAGE)!
        let color = UIColor.red
        let userInfo = [Constants.NotificationCenter.NS_GOKUNAME: name, Constants.NotificationCenter.NS_GOKUIMAGE: image, Constants.NotificationCenter.NS_GOKUCOLOR: color] as [String : Any]
        
        NotificationCenter.default.post(name: .dragonballNotification, object: nil, userInfo: userInfo)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func opmTapped(_ sender: UIButton) {
        let name = Constants.SAITAMA
        let image = UIImage(named: Constants.SAITAMA_IMAGE)!
        let color = UIColor.systemCyan
        let userInfo = [Constants.NotificationCenter.NS_SAITAMANAME: name, Constants.NotificationCenter.NS_SAITAMAIMAGE: image, Constants.NotificationCenter.NS_SAITAMACOLOR: color] as [String: Any]

        NotificationCenter.default.post(name: .onepunchmanNotification, object: nil, userInfo: userInfo)
        dismiss(animated: true, completion: nil)
    }

}

