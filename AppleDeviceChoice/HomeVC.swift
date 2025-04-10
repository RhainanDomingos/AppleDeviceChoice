//
//  ViewController.swift
//  Swift_NotificationCenterEProtocolo
//
//  Created by Rhainan Domingos on 21/02/25.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen = HomeScreen()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen.delegate(delegate: self)
        configObserver()
    }

    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook(notification:)), name: Notification.Name("Macbook"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac(notification:)), name: Notification.Name("Imac"), object: nil)
    }
    
    @objc func updateMacbook(notification: NSNotification) {
        homeScreen.logoImageView.image = UIImage(named: "MacbookPro")
        homeScreen.descriptionLabel.text = "Macbook Pro"
        view.backgroundColor = .red
    }
    
    @objc func updateImac(notification: NSNotification) {
        homeScreen.logoImageView.image = UIImage(named: "ImacPro")
        homeScreen.descriptionLabel.text = "Imac Pro"
        view.backgroundColor = .cyan
    }

}

extension HomeVC: HomeScreenProtocol {
    func tappedChooseButton() {
        print("Protocol funcionou")
        let vc = SelectionVC()
        vc.modalPresentationStyle = .fullScreen
        vc.delegate(delegate: self)
        present(vc, animated: true)
    }
}

extension HomeVC: SelectionVCProtocol {
    func updateMacbook() {
        homeScreen.logoImageView.image = UIImage(named: "MacbookPro")
        homeScreen.descriptionLabel.text = "Macbook Pro"
        view.backgroundColor = .red
    }
    
    func updateImac() {
        homeScreen.logoImageView.image = UIImage(named: "ImacPro")
        homeScreen.descriptionLabel.text = "Imac Pro"
        view.backgroundColor = .cyan
    }
    
    
}
