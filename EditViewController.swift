//
//  EditViewController.swift
//  sqlite
//
//  Created by Student-001 on 21/09/19.
//  Copyright © 2019 apurva. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var editDefaultId : String = ""
    var editDefaultName : String = ""
    @IBOutlet weak var editTextName: UITextField!
    
    
    @IBOutlet weak var editTextId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editTextId.text = editDefaultId
        editTextName.text = editDefaultName
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonUpdate(_ sender: UIButton) {
        
        let updateQuery = "update taskTable1 set taskName = '\(editTextName.text)' where taskId = ('\(editTextId.text!)'"
        
        let isSuccess = databaseLibrary.sharedObj.executeQuery(query: updateQuery)
        if isSuccess {
            print("update query success: ")
        }
        else {
            print("update query failed: ")
        }
        
    
    }
    
    
    @IBAction func buttonDelete(_ sender: UIButton) {
        
        let deleteQuery = "delete from taskTable1 where taskId = ('\(editTextId.text!)'"
        
        let isSuccess = databaseLibrary.sharedObj.executeQuery(query: deleteQuery)
        if isSuccess {
            print("delete query success: ")
        }
        else {
            print("delete query failed: ")
        }
        
        
        
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
