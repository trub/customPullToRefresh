//
//  ViewController.swift
//  PullRefresh
//
//  Created by Gabriel Theodoropoulos on 6/6/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: properties

    @IBOutlet weak var tblDemo: UITableView!
    
    var customView: UIView!
    
    var labelsArray: Array<UILabel> = []
    
    var dataArray: Array<String> = ["One", "Two", "Three", "Four", "Five"]
    
    var refreshControl: UIRefreshControl!
    
    // MARK: setup functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //additional setup
    
        tblDemo.delegate = self
        tblDemo.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.clearColor()
        refreshControl.tintColor = UIColor.clearColor()
        tblDemo.addSubview(refreshControl)
        
        loadCustomRefreshContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: custom functions
    
    func loadCustomRefreshContents() {
        let refreshContents = NSBundle.mainBundle().loadNibNamed("RefreshContents", owner: self, options: nil)
        
        customView = refreshContents[0] as! UIView
        customView.frame = refreshControl.bounds
        
        for var i=0; i<customView.subviews.count;i++ {
            labelsArray.append(customView.viewWithTag(i+1) as! UILabel)
        }
        
        refreshControl.addSubview(customView)
    }
    
    
    //MARK: table view functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
}

