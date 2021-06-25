//
//  ViewController.swift
//  Task
//
//  Created by Abhishek on 01/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var employeeList = [Employees]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Webservice.getAllEmployeeData(urlString : "https://jsonplaceholder.typicode.com/posts/1/comments",completion: {
            employeelist in
            if employeelist != nil {
                self.employeeList = employeelist ?? [Employees]()
                print("employeelist--",employeelist)
              
            }
        })
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
}

