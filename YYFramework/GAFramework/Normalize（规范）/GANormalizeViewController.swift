//
//  GANormalizeViewController.swift
//  YYFramework
//
//  Created by 侯佳男 on 2019/1/22.
//  Copyright © 2019年 houjianan. All rights reserved.
//

/*
import UIKit

class GANormalizeCircleViewController: UIViewController {
    
    let images = [UIImage(named: "ic_close")!, UIImage(named: "ic_code")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(reuseCollectionView)
    }
    
    lazy var reuseCollectionView: YYReuseCollectionView = {
        let v = YYReuseCollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300), allPage: images.count)
        v.delegate = self
        return v
    }()
}

extension GANormalizeCircleViewController: YYReuseCollectionViewDelegate {
    func reuseCollectionViewClicked(row: Int) {
        print(row)
    }
    
    func reuseCollectionViewGetImage(row: Int) -> UIImage {
        return images[row]
    }
}
*/

import UIKit

class GANormalizeViewController: YYBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
 
        print(UIDevice.current.normalize_modelName)
        
        base_showNavigationView(title: "list", isShow: false)
        base_initTableView()
        
        // Mon Jul 01 2019 18:10:29 GMT+0800 (UTC)
        let dateString = GADate.currentDateToDateString(dateFormat: GADateFormatType.utc.rawValue)
        print(dateString)
    }
    
    override func base_initTableView() {
        isShowTabbarView = true
        super.base_initTableView()
        tableView.yy_register(nibName: GANormalizeTestCell.identifier)
    }
    
    func initData() {
        dataSource = ["0、按钮", "1、switch", "2、缓存", "3、collectionView", "4、弹框提醒", "5、tableView", "6、textView", "7、textField", "8、request", "9、AD界面", "10、新特性", "11、pickerView", "12、扫码", "13、theme", "14、签名", "15、tabbar", "16、图片预览（未完成）", "17、轮播", "18、page control", "19、缓存大小", "20、tabsView", "21、popmenu", "22、collection-calender", "23、scroll-calender", "24、刷新"]
    }
    
    deinit {
        print("GANormalizeViewController - deinit")
    }
    
}

extension GANormalizeViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GANormalizeTestCell.identifier, for: indexPath) as! GANormalizeTestCell
        cell.l.text = dataSource[indexPath.row] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        let vcs: [String : UIViewController] = [
            dataSource[0] as! String : GANormalizeButtonViewController(nibName: "GANormalizeButtonViewController", bundle: nil),
            dataSource[1] as! String : GANormalizeSwitchViewController(nibName: "GANormalizeSwitchViewController", bundle: nil),
            dataSource[2] as! String : GANormalizeCacheViewController(nibName: "GANormalizeCacheViewController", bundle: nil),
            dataSource[3] as! String : GANormalizeTestCollectionViewController(),
            dataSource[4] as! String : GANormalizeAlertsViewController(nibName: "GANormalizeAlertsViewController", bundle: nil),
            dataSource[5] as! String : GANormalizeTestTableViewController(),
            dataSource[6] as! String : GANoralizeTestTextViewViewController(nibName: "GANoralizeTestTextViewViewController", bundle: nil),
            dataSource[7] as! String : GANoralizeTestTextFieldViewController(nibName: "GANoralizeTestTextFieldViewController", bundle: nil),
            dataSource[8] as! String : GANormalizeRequestViewController(nibName: "GANormalizeRequestViewController", bundle: nil),
            dataSource[9] as! String : GANormailizeADViewController(),
            dataSource[10] as! String : GANormailizeNewPaperViewController(),
            dataSource[11] as! String : GANormalizePickerViewController(nibName: "GANormalizePickerViewController", bundle: nil),
            dataSource[12] as! String : GANormalizeScanViewController(nibName: "GANormalizeScanViewController", bundle: nil),
            dataSource[13] as! String : GANormalizeThemeViewController(nibName: "GANormalizeThemeViewController", bundle: nil),
            dataSource[14] as! String : YYMosaicViewController(nibName: "YYMosaicViewController", bundle: nil),
            dataSource[15] as! String : UIStoryboard.init(name: "GANormalize", bundle: nil).instantiateInitialViewController()!,
            dataSource[16] as! String : GAPreviewImageViewController(config: nil),
            dataSource[17] as! String : GANormalizeCircleViewController(nibName: "GANormalizeCircleViewController", bundle: nil),
            dataSource[18] as! String : GAPageControlViewController(nibName: "GAPageControlViewController", bundle: nil),
            dataSource[19] as! String : GALocalFileCatchViewController(nibName: "GALocalFileCatchViewController", bundle: nil),
            dataSource[20] as! String : GANormalizeTabsTestViewController(),
            dataSource[21] as! String : GAPopMenuViewController(nibName: "GAPopMenuViewController", bundle: nil),
            dataSource[22] as! String : GACalenderViewController(nibName: "GACalenderViewController", bundle: nil),
            dataSource[23] as! String : GACalenderScrollViewController(),
            dataSource[24] as! String : GARefreshViewController(),
        ]
        
        let name = dataSource[indexPath.row] as! String
        let vc = vcs[name]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
