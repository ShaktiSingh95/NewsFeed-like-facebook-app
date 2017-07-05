//
//  FeedTableViewController.swift
//  DeeveHealth
//
//  Created by Shakti Pratap Singh on 05/07/17.
//  Copyright © 2017 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    var posts:[Post]!
    var owner:User!
    override func viewDidLoad() {
        super.viewDidLoad()
        posts=[]
        owner = User(name: "Shakti", profileImageLink: "abc.in")
        var i = 5
        while(i != 0){
            let post = Post(message: "This visage, no mere veneer of vanity, is a vestige of the vox populi, now vacant, vanished. However, this valorous visitation of a by-gone vexation, stands vivified and has vowed to vanquish these venal and virulent vermin vanguarding vice and vouchsafing the violently vicious and voracious violation of volition.", time: "2017-06-05 4:10:03", owner: owner)
            posts.append(post)
            i -= 1
        }
        
        if let navigationBar = self.navigationController?.navigationBar{
            navigationBar.barTintColor = UIColor.red
            navigationBar.tintColor = UIColor.white
            navigationBar.isTranslucent = false
            navigationBar.barStyle = .black
        }
        let newPostButton: UIButton = UIButton(type: .custom)
        newPostButton.setImage(UIImage(named: "+"), for: UIControlState.normal)
        newPostButton.addTarget(self, action: #selector(newPost), for: UIControlEvents.touchUpInside)
        newPostButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let newPostBarButton = UIBarButtonItem(customView: newPostButton)
        self.navigationItem.rightBarButtonItem = newPostBarButton
        
        let menuButton: UIButton = UIButton(type: .custom)
        menuButton.setImage(UIImage(named: "menu"), for: UIControlState.normal)
        menuButton.addTarget(self, action: #selector(menu), for: UIControlEvents.touchUpInside)
        menuButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let menuBarButton = UIBarButtonItem(customView: menuButton)
        self.navigationItem.leftBarButtonItem = menuBarButton
            // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    @objc private func newPost(){
        let destinationVc = self.storyboard?.instantiateViewController(withIdentifier: "new_post") as! NewPostViewController
        destinationVc.delegate=self
        destinationVc.owner = self.owner
        self.present(destinationVc, animated: true, completion: nil)
    }
    @objc private func menu(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed_cell", for: indexPath) as! FeedTableViewCell
        let post = posts[posts.count-indexPath.row-1]
        cell.message.text=post.message
        cell.comments.text = "\(post.comments.count) comments"
        cell.likes.text = "\(post.likes.count) likes"
        cell.userName.text = post.owner.name
        cell.owner=owner
        cell.post=post
        return cell
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
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
