//
//  SecondViewController.swift
//  MySwiftinUI
//
//  Created by chenjintao on 2020/12/2.
//

import Foundation
import UIKit

protocol SecondViewControllerDelegate : NSObjectProtocol {
    func secondFondSizeChange(controller:SecondViewController,fontSize:Int)
}

class SecondViewController: BasicViewController {
    
    var fontSize = 5
    var delegate : SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let count = 2
        self.navigationItem.title = "第\(count)页";
        
        initUI()
        
                 
//        //马赛克宽度
//        let itemWidth = 5
//        //行数
//        let rowNums = Int(self.view.bounds.height)/itemWidth
//        //列数
//        let colNums = Int(self.view.bounds.width)/itemWidth
//        for i in 0...rowNums {
//            for j in 0...colNums{
//                let item = UIView(frame: CGRect(x: j*itemWidth, y: i*itemWidth,
//                                                width: itemWidth, height: itemWidth))
//                //使用随机颜色
//                item.backgroundColor = UIColor.randomColor
//                self.view.addSubview(item)
//            }
//        }
    }
    
    func initUI()  {
        addBackButton()
        addClickImage()
    }
    
    let backButton = UIButton.init(type: .custom)
    func addBackButton() {
        self.view.addSubview(backButton)
        backButton.backgroundColor = UIColor.red
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 20
        backButton.mas_makeConstraints { (make) in
            make?.center.mas_equalTo()(self.view)
            make?.width.height()?.mas_equalTo()(55)
        }
        
    }
    
    func addClickImage() {
        let imageView = SWImageView.init(image: UIImage.init(named: "ios_180"))
        self.view.addSubview(imageView)
        imageView.addtarget(self, select: #selector(imageViewClick))
        imageView.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(backButton)
            make?.top.mas_equalTo()(backButton.mas_bottom)?.setOffset(10)
            make?.width.height()?.mas_equalTo()(64)
        }
        
    }
    
    @objc func backButtonAction(sender:UIButton) {
        sender.backgroundColor = UIColor.green
//        self.navigationController?.popViewController(animated: true)
        fontSize += 1
        delegate?.secondFondSizeChange(controller: self, fontSize: fontSize)
    }
    
    @objc func imageViewClick() {
        print("imageViewClick")
    }
    
}


extension UIColor {
    //返回随机颜色
    open class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
