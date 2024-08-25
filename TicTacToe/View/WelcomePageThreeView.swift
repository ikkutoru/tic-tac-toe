//
//  WelcomePageThreeView.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 22/08/24.
//

import UIKit

class WelcomePageThreeView: UIView {

    //MARK: IBOUTLETS
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var planetName: UITextField!
    
    //MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUi()
    }
    
    //MARK: Functions
    func setUpUi() {
        self.backgroundColor = .white
        
        titleLabel.text = "name, surname, \nwhatever"
        titleLabel.numberOfLines = 3
        titleLabel.font = UIFont.monospacedSystemFont(ofSize: 30, weight: .light)
        titleLabel.textColor = .black
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.monospacedSystemFont(ofSize: 15, weight: .light),
            .foregroundColor: UIColor.gray
        ]
        
        let attributedPlaceholder = NSAttributedString(string: "name, surname, whatever", attributes: attributes)
        let attributedPlaceholder2 = NSAttributedString(string: "planet name", attributes: attributes)

        nameTextField.attributedPlaceholder = attributedPlaceholder
        planetName.attributedPlaceholder = attributedPlaceholder2
        
        applyButton.setTitle("okay, let's go", for: .normal)
        applyButton.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 15, weight: .regular)
        applyButton.setTitleColor(.black, for: .normal)
        applyButton.layer.cornerRadius = 4
        applyButton.backgroundColor = UIColor(red: 36 / 255.0, green: 177 / 255.0, blue: 255 / 255.0, alpha: 0.5)
    }
}
