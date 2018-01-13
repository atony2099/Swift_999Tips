//
//  ViewController.swift
//  protocol-oriented
//
//  Created by admin on 13/01/2018.
//  Copyright © 2018 atony. All rights reserved.
//

import UIKit




class  CustomView: UIView, Shakeable {
    
}


class CustomCell: UITableViewCell, ReusableView, NibView {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func  prepareUI(){
         let label  = UILabel()
        label.text = restorationIdentifier;
        contentView.addSubview(label);
        label.frame = CGRect(x: 20, y: 20, width: 50, height: 200);
        label.backgroundColor = UIColor.black;
    }
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        customView.shake();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(CustomCell.self)

        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deuqueueCell(CustomCell.self, indexPath: indexPath);
        return cell;
        
    }
    
    
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

