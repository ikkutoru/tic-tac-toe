//
//  MainViewController.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 21/08/24.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: IBOUTLETS
    @IBOutlet var mainView: MainView!
    
    //MARK: VARS
    var isGameStarted: Bool?
    var score: Int?
    var winStreak: Int?
    
    //MARK: LIFECYCLE
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isGameStarted = false
        mainView.initialUiState(isGameStarted: isGameStarted)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture()
        
    }
    
    //MARK: IBACTIONS
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        mainView.initialUiState(isGameStarted: false)
    }
    
    //MARK: FUNCTIONS
    func updateUI() {
        
    }
    
    func whoWon() {
        
    }
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startGame))
        mainView.blurView.addGestureRecognizer(tapGesture)
    }
    
    @objc func startGame() {
        mainView.initialUiState(isGameStarted: true)
    }

}
