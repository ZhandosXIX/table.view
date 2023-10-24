//
//  ViewController.swift
//  table
//
//  Created by zhandos on 08.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelCountry: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    var name = ""
    var country = ""
    var imagename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelName.text = name
        labelCountry.text = country
        imageview.image = UIImage(named: imagename)
    }


}

