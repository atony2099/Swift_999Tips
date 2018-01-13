//
//  TableViewProtocol.swift
//  protocol-oriented
//
//  Created by admin on 13/01/2018.
//  Copyright © 2018 atony. All rights reserved.
//

import UIKit


extension UITableView {
    func registerClass<T:UITableViewCell & ReusableView >(_: T.Type){
        register(T.self, forCellReuseIdentifier: T.reuseIdentify)
    }
    
    func registerNibClass<T:UITableViewCell & NibView & ReusableView>(_: T.Type){
        let nib = UINib.init(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentify)
    }
    func deuqueueCell<T:UITableViewCell & ReusableView >(_:T.Type, indexPath:IndexPath) ->T {
        guard let cell = dequeueReusableCell(withIdentifier:T.reuseIdentify , for:indexPath) as? T else {
            fatalError("could not dequeue cell with ")
        }
        return cell;
    }
}

