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

//



// 3. ====枚举的传值
//
//switchData()
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// 2. ======
//
//
//
//
//print(SwiftEnum.east)
//
//// 2 ======. Associated Values
//enum StuInfo{
//    case first(Int,String)
//    case second(Int)
//}
//
//// a.可以携带不同的值
//var  xiaoming = StuInfo.first(10, "xiaoming")
//// b.可以重新赋值
//xiaoming = StuInfo.first(100, "xiaodong")
//
//switch xiaoming {
//case .first(let number,let name):
//    print(number,name)
//    break
//default:
//    break
//}
//
//
//// 3.===== RAW value:每个case创建的时候绑定的值
//enum  Name:String{
//    case no1 = "tom"
//    case no2 = "jim"
//}
//print(Name.no1.rawValue)
//
//
//// ===== a.defalut raw value int 从0开始，string equal the name
//enum  School:String{
//     case top
//     case second
//}
//print(School.top.rawValue)
//
//
//
//// ===== 4. advanced useage  ，枚举实际上也是一种高级的数据结构，跟类，结构体一样
//// 不能有
//enum Api: String {
//    case homePage = "baidu.com"
//    case perSon = "user.com"
//
//    var baseUrl:String {return "www"}
//
//    var totalUrl:String {
//        return baseUrl  + rawValue
//    }
//
//    // function  ===
//    func printOut(){
//        print(rawValue)
//    }
//}
//
//let api =  Api(rawValue: "baidu.com")
//let api2 = Api.perSon
//api!.totalUrl
//api2.totalUrl
//
//api2.printOut()
//
//
//
//func testOption(name:String?="abc"){
////    print(name)
//}
//
//testOption(name: nil)
//
//
//
//
//
//
//
//
//
//
//
//


















