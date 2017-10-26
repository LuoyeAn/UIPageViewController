//
//  ViewController.swift
//  UIPageViewCtrl
//
//  Created by Suriya Reddy on 26/10/17.
//  Copyright © 2017 Suriya Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    
    
    var pageImages: NSArray!
    var pageViewController: UIPageViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Images Names
        self.pageImages = ["1.jpg","2.jpg","3.jpg"]
        
        
        // Registering PageViewController from StoryBoard
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "pageViewController") as! UIPageViewController
        
        // PageViewContrller DataSource Method
        self.pageViewController.dataSource = self
        
        // Initialising the ViewController and setting ViewController to PageViewContrller
        let initialVC = self.contentViewAtIndex(0) as ContentViewController
        self.pageViewController.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
        
        
        // Setting the size of PageViewContrller
        self.pageViewController.view.frame = CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: self.view.frame.size.height - 100)
        
        // Adding the PageViewContrller to the Parent View
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
        
    }

  
    // Getting the current index Value
    
    func contentViewAtIndex(_ index: Int) -> ContentViewController
    {
        
        let contentViewCtrl = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        
        contentViewCtrl.imageName = pageImages[index] as! String
        contentViewCtrl.pageIndex = index
        
        
        return contentViewCtrl
        
    }
    
    // MARK: PageViewContrller DataSouce Methods

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        let viewCtrl = viewController as! ContentViewController
        var index = viewCtrl.pageIndex as Int
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }

        // Before ViewContrller, so we are (-) form the current index
        index -= 1
        
        return contentViewAtIndex(index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let viewCtrl = viewController as! ContentViewController
        var index = viewCtrl.pageIndex as Int
        if (index == NSNotFound)
        {
            return nil
        }
        
        // After ViewContrller, so we are (+) form the current index
        index += 1
        if(index == pageImages.count)
        {
            return nil
        }
        
        
        return self.contentViewAtIndex(index)
        
        
        
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return self.pageImages.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        return 0
        
    }
}

