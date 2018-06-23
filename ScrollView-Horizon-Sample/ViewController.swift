//
//  ViewController.swift
//  ScrollView-Horizon-Sample
//
//  Created by kawaharadai on 2018/06/23.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageWidth: CGFloat!
    var imageHeight: CGFloat!
    var imageNumber: CGFloat = 0
    
    //一度だけメニュー作成をするためのフラグ
    private var isPrepare = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 初回のみ実行
        if !isPrepare {
            self.imageWidth = self.view.frame.width
            self.imageHeight = self.scrollView.frame.size.height
            self.setupImageView()
            self.isPrepare = true
        }
    }
    
    private func setup() {
        // ページングスクロールを許可
        self.scrollView.isPagingEnabled = true
    }
    
    private func setupImageView() {
        // imageの数分のimageviewを作成し、横に並べる
        let dataSource = ScrollHelper.dataSource()
        
        dataSource.forEach { image in
            // TODO: この処理自体をヘルパーに委譲するとimageviewのcontentModeが不意に変更される
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0 + (imageWidth * imageNumber),
                                     y: 0,
                                     width: imageWidth,
                                     height: imageHeight)
            // 横サイズが画面いっぱいでない場合は中心点も合わせて決定させる
            imageView.center.x = self.view.center.x + (imageWidth * imageNumber)
            
            self.scrollView.addSubview(imageView)
            
            // 画像ごとに場所をずらしていく
            self.imageNumber += 1
        }
        
        // scrollviewのcontentsizeをいじる
        self.scrollView.contentSize = CGSize(width: imageWidth * CGFloat(dataSource.count), height: 0)
        
    }
}
