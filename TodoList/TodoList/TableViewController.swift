//
//  TableViewController.swift
//  TodoList
//
//  Created by xiaomo on 17/5/20.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,TodoContentCellProtocol {
    var todolists:[TodoList] = []
    var completedFlag = false
    var todoRepository = TodoRepository()
    
    func updateTodoState(cell: TodoContentCellTableViewCell, completed: Bool){
        // 接口中的cell参数，主要就是为了得到cell的indexPath值，这样才能找到其对应的Todo
        let indexPath = self.tableView.indexPath(for: cell)!
        let todo = self.todolists[indexPath.section].todos?[indexPath.row]
        todo?.complete = self.completedFlag
        
        // 打印状态看Todo模型是否得到更新
        print("completed state of todo \(todo!.content) is \(todo?.complete)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todolists = self.todoRepository.findAllItems()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.todolists.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.todolists[section].todos!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TodoContentCellTableViewCell
        let todo : Todo = (self.todolists[indexPath.section].todos?[indexPath.row])!
        
        if todo.complete != nil {
            completedFlag = todo.complete!
        }
        
        cell.item.text = todo.content
        cell.completedFlag.isSelected = completedFlag
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM-dd"
        let doText = dateFormater.string(from: todo.dueDate as! Date)
        cell.dueDate.text = doText
        
        // 设置cell的代理
        cell.delege = self
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
