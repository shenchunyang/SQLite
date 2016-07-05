//
//  delete.swift
//  SQLite
//
//  Created by ry耷拉拉星球 on 16/7/5.
//  Copyright © 2016年 scy. All rights reserved.
//

import UIKit

class delete: UIViewController {
    
    @IBOutlet weak var name1: UITextField!
    var db:SQLiteDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    
    @IBAction func deleee(sender: AnyObject) {
        del()
    }
    func del(){
        let a=name1.text!
        let sql = "delete from user where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
