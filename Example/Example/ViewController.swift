//
//  ViewController.swift
//  Example
//
//  Created by 张远文 on 2023/4/19.
//

import UIKit
import ALIconFont

class ViewController: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.imageV.image = UIImage(from: "tb", code: "\u{e745}", textColor: Color.red, backgroundColor: Color.green, size: CGSize(width: 100, height: 100))
        
    }
}

