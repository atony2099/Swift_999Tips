//
//  CollectionViewProtocol.swift
//  protocol-oriented
//
//  Created by admin on 13/01/2018.
//  Copyright © 2018 atony. All rights reserved.
//

import UIKit


protocol ReusableView where Self:UIView{
    static var reuseIdentify:String{get}
}
extension ReusableView {
    static var reuseIdentify:String {
        return String(describing:self)
    }
}

extension UICollectionViewCell:ReusableView{}

protocol NibView:class {
    static var nibName:String {get}
}

extension NibView where Self:UIView {
    // default implement
    static var nibName:String {
        return String(describing:self)
    }
}


extension UICollectionView {
    func registerClass<T:UICollectionViewCell >(_: T.Type){
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentify)
    }
    
    func registerNibClass<T:UICollectionViewCell & NibView>(_: T.Type){
        let nib = UINib.init(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentify)
    }
    
    func deuqueueCell<T:UICollectionViewCell>(_:T.Type, indexPath:IndexPath) ->T {
        guard let cell = dequeueReusableCell(withReuseIdentifier:T.reuseIdentify , for:indexPath) as? T else {
            fatalError("could not dequeue cell with ")
        }
        return cell;
    }
}


