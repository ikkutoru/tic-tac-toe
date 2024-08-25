//
//  WelcomePageViewController.swift
//  TicTacToe
//
//  Created by Viktor Ogay on 22/08/24.
//

import UIKit

class WelcomePageViewController: UIPageViewController {
    
    //MARK: VARS
    var pageControl = CustomVerticalPageControl()
    var vcArray = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpVcArray()
        setupPageControl()
        delegate = self
        dataSource = self
    }
    
    func setUpVcArray() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let page1 = storyboard.instantiateViewController(withIdentifier: "page1")
        let page2 = storyboard.instantiateViewController(withIdentifier: "page2")
        let page3 = storyboard.instantiateViewController(withIdentifier: "page3")
        
        vcArray.append(page1)
        vcArray.append(page2)
        vcArray.append(page3)
        
        if let firstPage = vcArray.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = vcArray.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

extension WelcomePageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = vcArray.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        
        return vcArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = vcArray.firstIndex(of: viewController) else {
            return  nil
        }
        
        let afterIndex = currentIndex + 1
        
        guard afterIndex < vcArray.count else {
            return nil
        }
        
        return vcArray[afterIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted: Bool) {
        if transitionCompleted {
            if let currentViewController = viewControllers?.first,
               let currentIndex = vcArray.firstIndex(of: currentViewController) {
                pageControl.currentPage = currentIndex
            }
        }
    }
}
