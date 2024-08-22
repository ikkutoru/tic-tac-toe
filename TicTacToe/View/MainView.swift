//
//  MainView.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 21/08/24.
//

import UIKit

class MainView: UIView {
    //MARK: IBOUTLETS
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var winStreakLabel: UILabel!
    @IBOutlet weak var winStreakNLabel: UILabel!
    @IBOutlet weak var scoreNLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var scoreboardButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var scoreView: UIView!
    
    //MARK: VARS
    var buttons: [UIButton] = []
    let buttonColor = UIColor(red: 36 / 255.0, green: 177 / 255.0, blue: 255 / 255.0, alpha: 0.5)
    
    //MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    //MARK: UI
    func configureUI() {
        buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9]
        
        blurView.alpha = 0.8
        
        separatorView.backgroundColor = .black
        separatorView.alpha = 0.5
        
        scoreLabel.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .light)
        scoreLabel.textColor = .black
        
        winStreakLabel.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .light)
        winStreakLabel.textColor = .black
        
        scoreNLabel.font = UIFont.monospacedSystemFont(ofSize: 21, weight: .regular)
        scoreNLabel.textColor = .black
        
        winStreakNLabel.font = UIFont.monospacedSystemFont(ofSize: 21, weight: .regular)
        winStreakNLabel.textColor = .black
        
        winnerLabel.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .medium)
        winnerLabel.numberOfLines = 2
        winnerLabel.lineBreakMode = .byWordWrapping
        winnerLabel.textColor = .black
        
        for button in buttons {
            button.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 30, weight: .semibold)
            button.setTitleColor(.black, for: .normal)
        }
        
        scoreboardButton.setTitle("scoreboard", for: .normal)
        scoreboardButton.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .regular)
        scoreboardButton.setTitleColor(.black, for: .normal)
        scoreboardButton.layer.cornerRadius = 4
        scoreboardButton.backgroundColor = buttonColor
        
        settingsButton.setTitle("settings", for: .normal)
        settingsButton.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .regular)
        settingsButton.setTitleColor(.black, for: .normal)
        settingsButton.layer.cornerRadius = 4
        settingsButton.backgroundColor = buttonColor
        
        exitButton.setTitle("exit", for: .normal)
        exitButton.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .regular)
        exitButton.setTitleColor(.black, for: .normal)
        exitButton.layer.cornerRadius = 4
        exitButton.backgroundColor = buttonColor
        
    }
    
    func initialUiState(isGameStarted: Bool?) {
        guard let isGameStarted = isGameStarted else { return }
        
        if isGameStarted {
            hideElements(
                hideScoreLabel: false,
                hideScoreNLabel: false,
                hideWinStreakLabel: false,
                hideWinStreakNLabel: false,
                hideScoreBoardButton: true,
                hideSettingsButton: true,
                hideExitButton: false,
                hideBlurView: true)
            
            scoreLabel.text = "score"
            winnerLabel.text = ""
        } else {
            hideElements(
                hideScoreLabel: false,
                hideScoreNLabel: true,
                hideWinStreakLabel: true,
                hideWinStreakNLabel: true,
                hideScoreBoardButton: false,
                hideSettingsButton: false,
                hideExitButton: true,
                hideBlurView: false)
            
            scoreLabel.text = "hello, User"
            winnerLabel.text = "tap on board to start. if you can..."
        }
    }
    
    func hideElements(hideScoreLabel: Bool?, hideScoreNLabel: Bool?, hideWinStreakLabel: Bool?, hideWinStreakNLabel: Bool?, hideScoreBoardButton: Bool?, hideSettingsButton: Bool?, hideExitButton: Bool?, hideBlurView: Bool?) {
        guard let hideScoreLabel = hideScoreLabel else { return }
        guard let hideScoreNLabel = hideScoreNLabel else { return }
        guard let hideWinStreakLabel = hideWinStreakLabel else { return }
        guard let hideWinStreakNLabel = hideWinStreakNLabel else { return }
        guard let hideScoreBoardButton = hideScoreBoardButton else { return }
        guard let hideSettingsButton = hideSettingsButton else { return }
        guard let hideExitButton = hideExitButton else { return }
        guard let hideBlurView = hideBlurView else { return }
        
        scoreLabel.isHidden = hideScoreLabel
        scoreNLabel.isHidden = hideScoreNLabel
        winStreakLabel.isHidden = hideWinStreakLabel
        winStreakNLabel.isHidden = hideWinStreakNLabel
        scoreboardButton.isHidden = hideScoreBoardButton
        settingsButton.isHidden = hideSettingsButton
        exitButton.isHidden = hideExitButton
        blurView.isHidden = hideBlurView
    }
}
