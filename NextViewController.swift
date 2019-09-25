//
//  NextViewController.swift
//  sqlite
//
//  Created by Student-001 on 18/09/19.
//  Copyright © 2019 apurva. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBAction func saveInDatabase(_ sender: UIButton) {
        let insertQuery = "insert into taskTable1(taskId, taskName) values ('\(taskIdText.text!)','\(taskNameText.text!)')"
        
        let isSuccess = databaseLibrary.sharedObj.executeQuery(query: insertQuery)
        if isSuccess {
            print("insert query success: ")
        }
        else {
            print("insert query failed: ")
        }
        
    }
    @IBOutlet weak var taskIdText: UITextField!
    @IBOutlet weak var taskNameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
