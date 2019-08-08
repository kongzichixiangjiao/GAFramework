//
//  GAPopMenuView.swift
//  YYFramework
//
//  Created by houjianan on 2019/4/9.
//  Copyright © 2019 houjianan. All rights reserved.
//  POPMENU

/*
import UIKit

class GAPopMenuViewController: UIViewController {
    
    @IBOutlet weak var b: UIButton!
    var menuView: GAPopMenuView!
    
    var models: [GAPopMenuModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = GAPopMenuModel()
        model.title = "123"
        models = [model, model]
        
        menuView = GAPopMenuView(frame: CGRect.zero, models: models, targetView: b, cellHeight: 40, cellWidth: 200, handler: { (row) in
            self.b.setTitle(self.models[0].title, for: .normal)
        })
        menuView.isHidden = true
        self.view.addSubview(menuView)
    }
    
    @IBAction func ac(_ sender: Any) {
        menuView.show(models: models)
    }
    
}
*/
import UIKit

enum GAPopMenuViewDirectionType: Int {
    case down = 0, up = 1, left = 2, right = 3
}

class GAPopMenuView: UIView {

    typealias PopMenuViewHandler = (_ row: Int) -> ()
    private var _popMenuViewHandler: PopMenuViewHandler?
    
    public var models: [GAPopMenuModel] = []
    public var targetView: UIView!
    private var _selectedColor: UIColor!
    private var _normalColor: UIColor!
    private var _bgColor: UIColor!
    private var _cellHeight: CGFloat!
    private var _cellWidth: CGFloat!
    
    private var _directionType: GAPopMenuViewDirectionType = .down
    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.frame = CGRect.zero
        t.separatorStyle = .none
        t.isScrollEnabled = false
        t.delegate = self
        t.dataSource = self
        return t
    }()
    
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = self._bgColor
        return v
    }()
    
    convenience init(frame: CGRect,
                     models: [GAPopMenuModel],
                     targetView: UIView,
                     bgColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3),
                     normalColor: UIColor = UIColor(red: 153 / 255, green: 153 / 255, blue: 153 / 255, alpha: 1),
                     selectedColor: UIColor = UIColor(red: 35 / 255, green: 132 / 255, blue: 224 / 255, alpha: 1),
                     cellHeight: CGFloat = 44,
                     cellWidth: CGFloat?,
                     handler: @escaping PopMenuViewHandler) {
        self.init(frame: frame)
        
        self.models = models
        self.targetView = targetView
        self._normalColor = normalColor
        self._selectedColor = selectedColor
        self._bgColor = bgColor
        self._cellHeight = cellHeight
        self._cellWidth = cellWidth
        
        self._popMenuViewHandler = handler
        _initViews()
    }
    
    private func _initViews() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        let rect = self.targetView.convert(self.targetView.bounds, to: delegate?.window)
        let x = rect.minX
        let maxY = rect.maxY
        let w = delegate?.window?.frame.size.width
        let h = delegate?.window?.frame.size.height
        
        self.frame = CGRect(x: 0, y: maxY, width: w!, height: h! - maxY)
        bgView.frame = self.bounds
        self.addSubview(bgView)
        
        tableView.register(UINib(nibName: "GAPopMenuCell", bundle: nil), forCellReuseIdentifier: "GAPopMenuCell")
        
        tableView.frame = CGRect(x: abs(x - _cellWidth / 2), y: 0, width: _cellWidth, height: _cellHeight * CGFloat(models.count))
        self.addSubview(tableView)
    }
    
    public func show(models: [GAPopMenuModel]) {
//        self.isHidden = false
        self.isHidden = !self.isHidden
        self.models = models
        tableView.reloadData()
    }
    
    public func hide() {
        self.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension GAPopMenuView: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GAPopMenuCell", for: indexPath) as! GAPopMenuCell
        let model = models[indexPath.row]
        cell.titleLabel.textColor = model.isSelected ? _selectedColor : _normalColor
        cell.titleLabel.text = model.title
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return _cellHeight
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _popMenuViewHandler?(indexPath.row)
        
        hide()
    }
}

class GAPopMenuModel {
    var title: String = ""
    var isSelected: Bool = false
}
