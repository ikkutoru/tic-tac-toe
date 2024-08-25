//
//  WelcomePageOneView.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 22/08/24.
//

import UIKit

class WelcomePageOneView: UIView {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var title2Label: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var swipeUpImageView: UIImageView!
    
    //MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUi()
    }
    
    //MARK: Functions
    func setUpUi() {
        self.backgroundColor = .white
        
        title1Label.text = "just a"
        title1Label.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .light)
        title1Label.textColor = .black
        
        title2Label.text = "you said?"
        title2Label.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .light)
        title2Label.textColor = .black
        
        mainTitleLabel.text = "tic-tac-toe"
        mainTitleLabel.font = UIFont.monospacedSystemFont(ofSize: 35, weight: .bold)
        mainTitleLabel.textColor = .black
        
        subtitleLabel.text = "okay, we'll see..."
        subtitleLabel.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .light)
        subtitleLabel.textColor = .black
        subtitleLabel.isHidden = true
        
        swipeUpImageView.image = UIImage(named: "swipe_up_icon")
        swipeUpAnimation()
    }
    
    func swipeUpAnimation() {
        let moveUpAnimation = CAKeyframeAnimation(keyPath: "position.y")
        let originalPosition = swipeUpImageView.center.y
        let upPosition = originalPosition + 20
        
        moveUpAnimation.values = [originalPosition, upPosition, originalPosition]
        moveUpAnimation.keyTimes = [0, 0.5, 1]
        moveUpAnimation.duration = 2
        moveUpAnimation.repeatCount = .greatestFiniteMagnitude
        swipeUpImageView.layer.add(moveUpAnimation, forKey: "moveUp")
        
    }

}
