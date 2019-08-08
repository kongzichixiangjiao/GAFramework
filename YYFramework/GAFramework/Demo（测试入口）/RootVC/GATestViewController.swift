//
//  GATestViewController.swift
//  YYFramework
//
//  Created by 侯佳男 on 2018/8/14.
//  Copyright © 2018年 houjianan. All rights reserved.
//

import UIKit
import Alamofire
//import GAMineDetailsViewController
import CTMediator

class GATestViewController: YYBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        base_showNavigationView(title: "list", isShow: false)
        base_initTableView()
    }
    
    override func base_initTableView() {
        isShowTabbarView = true
        super.base_initTableView()
        tableView.yy_register(nibName: GATestViewCell.identifier)
    }
    
    func initData() {
        dataSource = ["collectionViewCell自适应高度",
                      "联动",
                      "消息滚动动画",
                      "webView js交互 签名",
                      "最近搜索，标签",
                      "mine details",
                      "LayoutKit",
                      "html标签内容展示",
                      "身份证扫描验证",
                      "tabbarVC",
                      "HERO动画",
                      "视频播放",
                      "YYPlayerSlider",
                      "testJson假数据操作",
                      "一张图片签名",
                      "多张图片签名TableView",
                      "多张图片签名scrollView",
                      "pdf文件签名",
                      "word文件签名",
                      "视频压缩",
                      "本地视频播放",
                      "tabbarHeaderView(StackView)",
                      "webView预览",
                      "um统计",
                      "富文本点击事件Label"
        ]
    }
    
}

extension GATestViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GATestViewCell.identifier, for: indexPath) as! GATestViewCell
        cell.l.text = dataSource[indexPath.row] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcs = [
            dataSource[0] as! String : GAEstimatedCollectionViewController(),
            dataSource[1] as! String : YYInterlockViewController(),
            dataSource[2] as! String : YYHomeViewController(),
            dataSource[3] as! String : GAWebViewViewController(),
            dataSource[4] as! String : GATagCollectionViewController(),
//            dataSource[5] as! String : GAMineDetailsViewController(),
            dataSource[5] as! String : GALayoutKitViewController(),
            dataSource[6] as! String : GALayoutKitViewController(),
            dataSource[7] as! String : GAHtmlTagViewController(),
            dataSource[8] as! String : YYCardIOViewController(),
            dataSource[9] as! String : GATransitionableTabViewController(),
            dataSource[10] as! String : GAHeroAnimationViewController(),
            dataSource[11] as! String : YYPlayerViewController(nibName: "YYPlayerViewController", bundle: nil),
            dataSource[12] as! String : YYSliderViewController(nibName: "YYSliderViewController", bundle: nil),
            dataSource[13] as! String : GATestJsonViewController(nibName: "GATestJsonViewController", bundle: nil),
            dataSource[14] as! String : YYImageSignatureViewController(nibName: "YYImageSignatureViewController", bundle: nil),
            dataSource[15] as! String : YYImagesSignatureViewController(),
            dataSource[16] as! String : YYImagesSignatureScrollViewController(),
            dataSource[17] as! String : GAPDFSignatureViewController(),
            dataSource[18] as! String : GAWordFileSignatureViewController(),
            dataSource[19] as! String : PXVideoViewController(nibName: "PXVideoViewController", bundle: nil),
            dataSource[20] as! String : GALocalVideoPlayerViewController(nibName: "GALocalVideoPlayerViewController", bundle: nil),
            dataSource[21] as! String : GAStackViewViewController(nibName: "GAStackViewViewController", bundle: nil),
            dataSource[22] as! String : GAWebViewPreviewViewController(),
            dataSource[23] as! String : GAUMViewController(nibName: "GAUMViewController", bundle: nil),
            dataSource[24] as! String : GAEventLabelViewController(),
        ]
        let name = dataSource[indexPath.row] as! String
        let vc = vcs[name]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

