//
//  ViewController.swift
//  Class Roster Part 2
//
//  Created by Kevin Pham on 8/12/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var students = [Person]()
    var studentInfo = [["firstName" : "Jake", "lastName" : "Foster"], ["firstName" : "Nathan", "lastName" : "Peterson"], ["firstName" : "Bamboo", "lastName" : "Nguyen"], ["firstName" : "Khanh", "lastName" : "Nguyen"], ["firstName" : "Kevin", "lastName" : "Pham"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        studentArray(studentInfo)
    }
    
    func studentArray(studentArray: NSArray) {
        for student in studentArray {
            var newPerson = Person(firstName: student["firstName"] as String, lastName: student["lastName"] as String)
            students.append(newPerson)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // if section == 0 {
        //     return 5
        // } else {
        //     return 1000
        // }
        // return self.names(indexPath.row)
        return self.students.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // get my cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        // configure it for the row
        var studentForRow = self.students[indexPath.row]
        cell.textLabel.text = studentForRow.fullName()
        // return the cell
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var studentForRow = self.students[indexPath.row]
        println(indexPath.row)
        println(studentForRow.fullName())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "showDetail" {
            println("Show Detail GO!")
            var detailViewController = segue.destinationViewController as DetailViewController
            let section = tableView.indexPathForSelectedRow().section
            let row = tableView.indexPathForSelectedRow().row
            
            detailViewController.selectedPerson = students[row]
        } else {
            println("Successful Segue!")
        }
    }

}

// Advanced Challenge (not mandatory): Using Apple's documentation as a guide, load in the array of Person objects from a .plist file in your bundle
// func pathForResource() -> String {
// let path = NSBundle.mainBundle().pathForResource("StudentArray", ofType: "plist")    // Path of plist
// let RosterArray = NSArray(contentsOfFile: path)                                      // Initializing array from plist

// println(RosterArray)                                                                 // Print contents of array
// return RosterArray
// }