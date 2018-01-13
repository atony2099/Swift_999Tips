//: Playground - noun: a place where people can play

import UIKit


//========== 枚举的基本定义 ===========
// 1.swift中的枚举进化成一种高级的数据结构


enum StrongValue{
    case north(Int)
    case south(Int,String)
    case east(Int)
    case west(String)
    
    var currentDirection:String {
        return "i am current \(self)"
    }
    
    func logCurrentDirection(){
        print(self)
    }
    
}




//  1. 场景：有三个按钮 软件，音乐，书本，点击不同的按钮执行不同的搜索
//  tips:枚举自定义计算变量
enum  SerachType:Int{
    case software = 0
    case music = 1
    case book = 2
    var type:String {
        switch self {
        case .software:return "software"
        case .music: return "music"
        case .book:return "book"
        }
    }
}
func clickButton(buttonTag:Int){
    let searchType = SerachType(rawValue: buttonTag)
    let serachParams = searchType?.type;
    print("start search  with params:\(serachParams ?? "not value")")
}

clickButton(buttonTag: 0);

// 2.场景:有一组api地址，需要对他们进行管理，要求方便拓展和修改
// tips:枚举值可以自定义计算变量
enum Api: String {
    case homePage = "home"
    case person = "user"
    var baseUrl:String{
        return   "https://apple.com/"
    }
    var lastUrl:String {
        return baseUrl  + rawValue
    }
    
}
let homePageAPI = Api.homePage
let homePagePath = homePageAPI.lastUrl
print(homePagePath)



// 3.场景:请求网络接口，根据不同的请求结果返回响应的数据
// tips:枚举值可以携带变量
enum SearchResult{
    case notSearchedYet
    case netError(String)
    case successResult([String]?)
}

func getUserName(){
    print("start queryData======")
    
    var result = SearchResult.notSearchedYet
    let code = 200 // success get data
    if code == 200 {
        result  = SearchResult.successResult(["tom","jim"])
    } else {
        result = SearchResult.netError("service has crash")
    }
    
    switch result {
    case .successResult(let datas):
        print(datas as Any)
        break;
        
    case .netError(let error):
        print(error as Any)
        break;

    default:
        break;
        
    }

}

getUserName()






// enum ：

// 每个枚举值绑定值
// 1. rawvalue ，初始化的时候创建， //string  characters, charater floa
// 2. asscociat value: 每次创建的时候绑定新的值

// associateValue:
enum RawT:Int {
    case first = 0
    case second = 1
}
let type = RawT.init(rawValue: 1)

enum Raw {
    case first(String)
    case second
}
//
let r = Raw.first("hah")






























