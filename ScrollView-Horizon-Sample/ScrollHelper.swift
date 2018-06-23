//
//  ScrollHelper.swift
//  ScrollView-Horizon-Sample
//
//  Created by kawaharadai on 2018/06/23.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class ScrollHelper {
    
    static let imageNameArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"]
    
    /// 画像名からUIImageの配列を用意
    ///
    /// - Returns: UIImageの配列
    static func dataSource() -> [UIImage] {
        let imageArray: [UIImage] = imageNameArray.map {
            UIImage(named: $0) ?? UIImage(named: "noimage")!
        }
        return imageArray
    }
    
    // TODO: 現状、使用できていないメソッド（この処理自体をヘルパーに委譲するとimageviewのcontentModeが不意に変更される）
    /// UIImageを受け取り、UIImageViewを作成、横に順に並べて配置する
    ///
    /// - Parameters:
    ///   - image: 表示画像
    ///   - imageNumber: 画像番号
    ///   - imageWidth: imageViewの横幅
    ///   - imageHeight: imageViewの縦幅
    ///   - imageCenterX: imageViewの縦軸の中心点
    /// - Returns: 渡した画像番号の沿って一定間隔(横幅に比例)で横一列にUIImageViewが配置されていく
    static func setLayout(image: UIImage,
                          imageNumber: CGFloat,
                          imageWidth: CGFloat,
                          imageHeight: CGFloat,
                          imageCenterX: CGFloat) -> UIImageView {
        
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0 + (imageWidth * imageNumber),
                                 y: 0,
                                 width: imageWidth,
                                 height: imageHeight)
        // 横サイズが画面いっぱいでない場合は中心点も合わせて決定させる
        imageView.center.x = imageCenterX + (imageWidth * imageNumber)
        
        return imageView
        
    }
    
}
