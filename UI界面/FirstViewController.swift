//
//  FirstViewController.swift
//  MySwiftinUI
//
//  Created by chenjintao on 2020/12/2.
//

import Foundation
import UIKit
import Masonry

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SecondViewControllerDelegate {
    
    var clickCount = 0
    var dataSource = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.navigationItem.title = "SwitfUI"
        
        for index in 0 ... 30 {
            dataSource.add(String("SwitfUI--:\(index)"))
        }
        
        // 初始化item
        addItem()
        
        // 初始化UI
        initUI()
    }
    
    // 初始化item
    func addItem() {
        
        let leftItem = UIBarButtonItem.init(title: "帮助", style: .plain, target: self, action: #selector(helpItem))
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem.init(title: "设置", style: .plain, target: self, action: #selector(settingItem))
//        self.navigationItem.rightBarButtonItem = rightItem
        
        let nextPage = UIBarButtonItem.init(title: "下一页", style: .plain, target: self, action: #selector(nextPageAction))
        
        self.navigationItem.rightBarButtonItems = [nextPage,rightItem]
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
    let label = UILabel()
    func addTopView() {
        self.view.addSubview(topView)
        topView.backgroundColor = UIColor.orange
        topView.frame = CGRect.init(x: 10, y: 22, width: 150, height: 150)
        topView.mas_makeConstraints { (make) in
            make?.left.top().right().mas_equalTo()(self.view)
            make?.height.mas_equalTo()(150)
        }
        
        topView.addSubview(label)
        label.text = "我是label"
        label.mas_makeConstraints { (make) in
//            make?.center.mas_equalTo()(topView)
            make?.centerX.mas_equalTo()(topView)
            make?.bottom.mas_equalTo()(-10)
            make?.width.offset()(100)
            make?.height.offset()(55)
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
            mark?.bottom.mas_equalTo()(self.view)?.setOffset(-50)
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
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style:.value1, reuseIdentifier: cellid)
        }
//        cell?.backgroundColor = UIColor.green
        let titl = dataSource.object(at: indexPath.row) as? String
        cell?.textLabel?.text = titl
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let title = dataSource.object(at: indexPath.row) as? String
        print("row \(indexPath.row):\(title)")
    }
    
    
    @objc func buttonClickAction(button:UIButton) {
        clickCount += 1
        bottomButton.setTitle("点我\(clickCount)", for: .normal)
        print("clickCount:\(clickCount)")
        
        button.backgroundColor = UIColor.green
    }
    
    
    @objc func helpItem() {
        print("helpItem")
    }
    
    @objc func settingItem() {
        print("settingItem")
    }
    
    @objc func nextPageAction() {
        print("nextPageAction")
        let vc = SecondViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func secondFondSizeChange(controller: SecondViewController, fontSize: Int) {
        print("\(self.description) from:\(controller) fontSize:\(fontSize)")
        label.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    }
}
