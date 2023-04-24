//
//  TableIconsVC.swift
//  Example
//
//  Created by 张远文 on 2023/4/23.
//

import UIKit
import ALIconFont

public class TableIconsVC: UITableViewController {
    
    let icons: [Icon] = [
        Icon(name: "icon-ju", code: "\u{e745}", color: UIColor.red, size: 50),
        Icon(name: "icon-ju", code: "\u{e745}", color: UIColor.red, size: 50),
        Icon(name: "icon-ju", code: "\u{e745}", color: UIColor.red, size: 100),
        Icon(name: "icon-ju", code: "\u{e745}", color: UIColor.red, size: 200),
        Icon(name: "icon-ju", code: "\u{e745}", color: UIColor.red, size: 300),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-command", code: "\u{e73f}"),
        Icon(name: "icon-communityfill", code: "\u{e740}"),
        Icon(name: "icon-community", code: "\u{e741}"),
        Icon(name: "icon-read", code: "\u{e742}"),
        Icon(name: "icon-suan", code: "\u{e743}", color: UIColor.red, size: 56),
        Icon(name: "icon-hua", code: "\u{e744}", color: UIColor.red, size: 56),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-attention", code: "\u{e73d}"),
        Icon(name: "icon-commandfill", code: "\u{e73e}", size: 60)
    ]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return icons[indexPath.row].size
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icon = icons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Icon", for: indexPath)
        cell.textLabel?.text = icon.name
        let start = CFAbsoluteTimeGetCurrent()
        
        cell.imageView?.image = UIImage.icon(fontName: icon.fontName, code: icon.code, color: icon.color, size: CGSize(width: icon.size, height: icon.size))
        
        let end = CFAbsoluteTimeGetCurrent()
        let time = (end - start) * 1000
        print("\(icon.name) - \(time) ms")
        return cell
    }
}

struct Icon {
    let fontName: String = "tb"
    let name: String
    let code: String
    var color: UIColor = UIColor.black
    var size: CGFloat = 30
    var drawTime: TimeInterval = 0
}
