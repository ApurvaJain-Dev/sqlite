//
//  ViewController.swift
//  sqlite
//
//  Created by Student-001 on 18/09/19.
//  Copyright © 2019 apurva. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var allTaskNames = [String]()
    var allTaskIds = [String]()
    @IBAction func nextButton(_ sender: UIBarButtonItem) {
        let next = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        navigationController?.pushViewController(next, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTaskIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = allTaskIds[indexPath.row]
        cell.detailTextLabel?.text = allTaskNames[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        let selectQuery = "select taskId,taskName from taskTable1"
        databaseLibrary.sharedObj.selectAllTask(query: selectQuery)
        allTaskIds = databaseLibrary.sharedObj.taskId
        allTaskNames = databaseLibrary.sharedObj.taskName
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        
       let cell = tableView.cellForRow(at: indexPath)
        editVC.editDefaultId = (cell?.textLabel?.text)!
        editVC.editDefaultName = (cell?.detailTextLabel?.text)!
        navigationController?.pushViewController(editVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

