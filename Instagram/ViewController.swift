//
//  ViewController.swift
//  Instagram
//
//  Created by 三宅亮輔 on 2017/08/22.
//  Copyright © 2017年 dosueeee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var post = Post.allPosts
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "PostTableViewCell ", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "postCell")
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.barTintColor = UIColor(hex: "1A237E")
        
        title = "Instagram"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return post.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PostTableViewCell
        
        cell.post = post[indexPath.row]
        
        return cell
    }


}



















