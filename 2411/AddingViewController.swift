//
//  AddingViewController.swift
//  2411
//
//  Created by User on 12/11/20.
//  Copyright © 2020 huseynova. All rights reserved.
//

import UIKit
import Foundation

class AddingViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var day: UITextField!
    
    
    @IBOutlet weak var month: UITextField!
    
    
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var birthPlaceField: UITextField!
    

    
    
    @IBAction func addEmployee(_ sender: UIButton) {
       
      addingPerson()
        print("added")
        
    }
    


    func addingPerson() {
        
    
        let birthDay = (day.text ?? " ") + String(month.text ?? " ") + String(year.text ?? " ")

 let newEmployee = Employees(name: nameField.text ?? "", birthMonth: Int(month.text ?? "0") ?? 0, birthYear: Int(year.text ?? "0" ) ?? 0, birthDate: birthDay, birthPlace: birthPlaceField.text ?? "", imageName: "new")
        
        
        employees.append(newEmployee)

    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
