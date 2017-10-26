//
//  ContentViewController.swift
//  UIPageViewCtrl
//
//  Created by Suriya Reddy on 26/10/17.
//  Copyright © 2017 Suriya Reddy. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    var imageName: String!
    var pageIndex:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myImage.image = UIImage(named: imageName)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
