//
//  WelcomePageTwoView.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 22/08/24.
//

import UIKit

class WelcomePageTwoView: UIView {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUi()
    }
    
    //MARK: Functions
    func setUpUi() {
        self.backgroundColor = .black
        titleLabel.text = "Rules should be here\nbut later..."
        titleLabel.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .light)
        titleLabel.textColor = .white
    }
}
