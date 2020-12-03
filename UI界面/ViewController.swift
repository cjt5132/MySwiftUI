//
//  ViewController.swift
//  MySwiftinUI
//
//  Created by chenjintao on 2020/12/1.
//

import UIKit
import Masonry

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var clickCount = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        // 初始化UI
        initUI()
    }
    
    // 初始化UI
    func initUI() {
        // 顶部视图
        addTopView()
        // 添加tableview
        addTableView()
        // 添加按钮
        addBottomButton()
    }

    // 添加顶部视图
    let topView = UIView()
    func addTopView() {
        self.view.addSubview(topView)
        topView.backgroundColor = UIColor.orange
        topView.frame = CGRect.init(x: 10, y: 22, width: 150, height: 150)
        topView.mas_makeConstraints { (make) in
            make?.left.top().right().mas_equalTo()(self.view)
            make?.height.mas_equalTo()(150)
        }
    }
    
    let bottomButton = UIButton()
    func addBottomButton() {
        self.view.addSubview(bottomButton)
        bottomButton.setTitle("点我", for: .normal)
        bottomButton.addTarget(self, action:#selector(buttonClickAction), for: .touchUpInside)
        bottomButton.backgroundColor = UIColor.orange
        bottomButton.layer.cornerRadius = 10
        bottomButton.clipsToBounds = true
        bottomButton.mas_makeConstraints { (mark) in
            mark?.left.mas_equalTo()(20)
            mark?.right.mas_equalTo()(-20)
            mark?.bottom.mas_equalTo()(self.view)?.setOffset(-20)
            mark?.height.setOffset(44)
        }
    }
    
    // 添加tableview
    let tableView = UITableView()
    func addTableView() {
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.mas_makeConstraints { (make) in
            make?.left.right()?.bottom()?.mas_equalTo()(self.view)
            make?.top.mas_equalTo()(topView.mas_bottom)
        }
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style:.value1, reuseIdentifier: cellid)
        }
        cell?.backgroundColor = UIColor.green
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
    
    
    @objc func buttonClickAction(button:UIButton) {
        clickCount += 1
        bottomButton.setTitle("点我\(clickCount)", for: .normal)
        print("clickCount:\(clickCount)")
        
        button.backgroundColor = UIColor.green
    }
    
}

