//
//  DetailViewController.swift
//  2411
//
//  Created by User on 12/9/20.
//  Copyright © 2020 huseynova. All rights reserved.
//

import UIKit
import Foundation


class DetailViewController: UIViewController {
    
    @IBOutlet weak var employeeImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var birthPlaceLabel: UILabel!
       

    var employee: Employees?

        override func viewDidLoad() {
            super.viewDidLoad()
            employeeImage.image = UIImage(named: employee!.imageName)
            employeeImage.layer.cornerRadius = 80
            employeeImage.layer.borderWidth = 0.5
            employeeImage.layer.borderColor = UIColor.white.cgColor
            employeeImage.clipsToBounds = true
            nameLabel.text = employee?.name
            birthDayLabel.text = employee?.birthDate
            birthPlaceLabel.text = employee?.birthPlace

    }
    }




