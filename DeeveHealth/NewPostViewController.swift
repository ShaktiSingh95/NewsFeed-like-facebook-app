//
//  NewPostViewController.swift
//  DeeveHealth
//
//  Created by Shakti Pratap Singh on 05/07/17.
//  Copyright © 2017 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController {

    @IBOutlet weak var message: UITextView!
    var delegate:FeedTableViewController!
    var owner:User!
    @IBAction func post(_ sender: UIButton) {
        let post = Post(message: message.text, time: "2017-09-12 12:12:12", owner: owner)
        delegate.posts.append(post)
        self.dismiss(animated: true, completion: nil)
    }
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
