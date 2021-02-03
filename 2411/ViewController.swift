//
//  ViewController.swift
//  2411
//
//  Created by User on 11/24/20.
//  Copyright © 2020 huseynova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var winterArray = [Employees]()
    var autemnArray = [Employees]()
    var summerArray = [Employees]()
    var bikYear = [Employees]()
    var springArray = [Employees]()

    var showingArray = [Employees]()

    func configureArrays() {
        for employee in employees {
            if 1...2 ~= employee.birthMonth || employee.birthMonth == 12 {
                winterArray.append(employee)
            }
            if 3...5 ~= employee.birthMonth {
                springArray.append(employee)
            }
            if 6...8 ~= employee.birthMonth {
                summerArray.append(employee)
            }
            if 9...11 ~= employee.birthMonth {
                autemnArray.append(employee)
            }
            var bikYearInt = 1997
            for _ in 0...4 {
                bikYearInt -= 12
                if employee.birthYear == bikYearInt {
                    bikYear.append(employee)
                }
            }
        }
    }

    
    
  
    
    

    
    
  
    
    @IBAction func winterPressed(_ sender: UIButton) {
        showingArray = winterArray
        employeesTableView.reloadData()
        
    }
    
    @IBAction func springPressed(_ sender: UIButton) {
        showingArray = springArray
        employeesTableView.reloadData()
    }
    
    @IBAction func summerPressed(_ sender: UIButton) {
        showingArray = summerArray
        employeesTableView.reloadData()
    }
    
    @IBAction func autemnPressed(_ sender: UIButton) {
        showingArray = autemnArray
        employeesTableView.reloadData()
    }
    
    @IBAction func bikYearPressed(_ sender: UIButton) {
        showingArray = bikYear
        employeesTableView.reloadData()
    }

    @IBAction func addingNew(_ sender: UIButton) {
        performSegue(withIdentifier: "toAdding", sender: self)
    }
    
    
    @IBAction func allEmloyees(_ sender: UIButton) {
        showingArray = employees
        employeesTableView.reloadData()
    }
    
   
    
    
    @IBOutlet weak var employeesTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        showingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employee = showingArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = (employee.name) + (employee.birthDate)
        cell.detailTextLabel?.text = employee.birthDate
        cell.imageView?.image = UIImage(named: employee.imageName)
        cell.imageView!.layer.cornerRadius = 21
        cell.imageView!.layer.borderWidth = 0.5
        cell.imageView!.layer.borderColor = UIColor.white.cgColor
        cell.imageView!.clipsToBounds = true
        return cell
    }


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableView.deselectRow(at: indexPath, animated: true)
    
        performSegue(withIdentifier: "toDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailViewController {
            destination.employee = employees[(employeesTableView.indexPathForSelectedRow?.row)!]
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesTableView.dataSource = self
        employeesTableView.delegate = self
        configureArrays()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    
        
    }


}



