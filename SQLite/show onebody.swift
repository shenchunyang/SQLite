//
//  show onebody.swift
//  SQLite
//
//  Created by ry耷拉拉星球 on 16/7/6.
//  Copyright © 2016年 scy. All rights reserved.
//

import Foundation
import UIKit

class showoneController: UIViewController {
    
    
    @IBOutlet weak var textname: UITextField!
    @IBOutlet weak var view2: UITextView!
    var db:SQLiteDB!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        //show1()
    }
    @IBAction func query(sender: AnyObject)
    {
        select()
    }
    
    func select() {
        let name1=textname.text!
        let data = db.query("select * from user where uname='\(name1)'")
        for var x=0;x<data.count;x++
        {
            let user = data[x]
            view2.text! += "联系人:" + String(user["uname"]!) + "\n" + "联系方式:" + String(user["mobile"]!) + "\n" + "邮箱:" + String(user["email"]!) + "\n" + "家庭住址" + String(user["address"]!) + "\n"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}