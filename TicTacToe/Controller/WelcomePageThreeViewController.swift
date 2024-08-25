//
//  WelcomePageThreeViewController.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 22/08/24.
//

import UIKit

class WelcomePageThreeViewController: UIViewController {
    
    //MARK: Vars
    let customTransition = CustomTransition()
    let mainView = WelcomePageThreeView()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    @IBAction func applyButtonTapped(_ sender: Any) {
        guard let nameText = mainView.nameTextField.text, !nameText.isEmpty else {
            print("name empty")
            return
        }
        guard let planetNameText = mainView.planetName.text, !planetNameText.isEmpty else {
            print("planet empty")
            return
        }
        
        UserDefaults.standard.setValue(nameText, forKey: "name")
        UserDefaults.standard.setValue(planetNameText, forKey: "planetName")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVc = storyboard.instantiateViewController(withIdentifier: "mainVc")
        mainVc.modalPresentationStyle = .fullScreen
        mainVc.transitioningDelegate = self
        present(mainVc, animated: true, completion: nil)
    }
}

extension WelcomePageThreeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
