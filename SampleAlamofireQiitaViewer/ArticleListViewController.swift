//
//  ArticleListViewController.swift
//  SampleAlamofireQiitaViewer
//
//  Created by 稲垣悠一 on 2016/08/17.
//  Copyright © 2016年 稲垣悠一. All rights reserved.
//

import UIKit
import Alamofire // Alamofireをimport
import SwiftyJSON // SwiftyJSONをimport

class ArticleListViewController: UIViewController {

    let table = UITableView() // プロパティにtableを追加
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "新着記事" // Navigation Barのタイトルを設定
        table.frame = view.frame // tableの大きさをviewの大きさに合わせる
        view.addSubview(table) // viewにtableを乗せる
        
        getArticles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getArticles() {
        Alamofire.request(.GET, "https://qiita.com/api/v2/items") // APIへリクエストを送信
            .responseJSON(completionHandler: { response in
//            print(response.result.value) // responseのresultプロパティのvalueプロパティをコンソールに出力
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                json.forEach({ (_, json) in
                    print(json["title"].string!) // 記事タイトルを表示
                    print("  @" + json["user"]["id"].string!) // 投稿者のユーザーIDを表示
                })
        })
    }
    
}




