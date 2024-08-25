//
//  CustomVerticalPageControl.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 22/08/24.
//

import UIKit

class CustomVerticalPageControl: UIView {
    let blueColor = UIColor(red: 36 / 255.0, green: 177 / 255.0, blue: 255 / 255.0, alpha: 0.5)
    private var dots: [UIView] = []
        private let dotSize: CGFloat = 6
        private let spacing: CGFloat = 8

        var numberOfPages: Int = 0 {
            didSet {
                setupDots()
            }
        }
        
        var currentPage: Int = 0 {
            didSet {
                updateDots()
            }
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
        }

        private func setupView() {
            // Initialize dots if needed
            setupDots()
        }

        private func setupDots() {
            // Remove existing dots
            dots.forEach { $0.removeFromSuperview() }
            dots.removeAll()
            
            // Add new dots
            for _ in 0..<numberOfPages {
                let dot = UIView()
                dot.backgroundColor = .lightGray
                dot.layer.cornerRadius = dotSize / 2
                dot.translatesAutoresizingMaskIntoConstraints = false
                addSubview(dot)
                dots.append(dot)
            }
            
            // Layout dots vertically
            for (index, dot) in dots.enumerated() {
                NSLayoutConstraint.activate([
                    dot.widthAnchor.constraint(equalToConstant: dotSize),
                    dot.heightAnchor.constraint(equalToConstant: dotSize),
                    dot.centerXAnchor.constraint(equalTo: centerXAnchor),
                    dot.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(index) * (dotSize + spacing))
                ])
            }
            
            // Adjust the height of the view
            let totalHeight = CGFloat(numberOfPages) * (dotSize + spacing) - spacing
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: totalHeight)
            ])
            
            updateDots()
        }

        private func updateDots() {
            for (index, dot) in dots.enumerated() {
                dot.backgroundColor = (index == currentPage) ? blueColor : .lightGray
            }
        }
    }
