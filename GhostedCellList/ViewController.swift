//
//  ViewController.swift
//  GhostedCellList
//
//  Created by Henrique Valcanaia on 2020-02-18.
//  Copyright © 2020 Henrique Valcanaia. All rights reserved.
//

import UIKit

final class GhostedTableViewCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var tilesView: UIImageView!
}

final class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}

extension UIViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "id") as! GhostedTableViewCell
        dequeuedCell.myLabel?.text = String(repeating: "Cell: \(indexPath.row)", count: Int.random(in: 1...30))
        return dequeuedCell
        
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
//        cell.backgroundView = UIView()
//        let spacing: CGFloat = 10
//        let lineWidth: CGFloat = 3
//        let numberOfHorizontalLines = Int(cell.frame.size.width / (spacing + lineWidth))
//        let lineEndXFactor = CGFloat(sin(45 * Double.pi/180))
//        for lineIndex in 1...numberOfHorizontalLines {
//            let lineStartingX = CGFloat(lineIndex) * spacing + CGFloat(lineIndex-1) * lineWidth
//            let lineStartPoint = CGPoint(x: lineStartingX, y: 0)
//            let lineEndPoint = CGPoint(x: lineStartingX + (lineEndXFactor * cell.frame.size.height), y: cell.frame.size.height)
//
//            self.addLine(fromPoint: lineStartPoint, toPoint: lineEndPoint, to: cell.backgroundView!)
//        }
//
//        let numberOfVerticalLines = Int(cell.frame.size.width / (spacing + lineWidth)) - 1 // the first horizontal line
//        for lineIndex in 1...numberOfVerticalLines {
//            let lineStartingY = CGFloat(lineIndex) * spacing + CGFloat(lineIndex-1) * lineWidth
//            let lineStartPoint = CGPoint(x: 0, y: lineStartingY)
//            let endX = cell.frame.size.height - lineStartingY
//            let lineEndPoint = CGPoint(x: endX - lineEndXFactor, y: cell.frame.size.height)
//
//            self.addLine(fromPoint: lineStartPoint, toPoint: lineEndPoint, to: cell.backgroundView!)
//        }
        
        //        let renderer1 = UIGraphicsImageRenderer(size: cell.frame.size)
        //        let img1 = renderer1.image { ctx in
        //            for lineIndex in 1...numberOfLines {
        //                ctx.cgContext.setStrokeColor(UIColor.yellow.cgColor)
        //                ctx.cgContext.setLineWidth(lineWidth)
        //
        //                ctx.cgContext.move(to: lineStartPoint)
        //                ctx.cgContext.addLine(to: lineEndPoint)
        //
        ////                ctx.cgContext.addRect(cell.frame)
        //                ctx.cgContext.drawPath(using: .fillStroke)
        //            }
        //        }
        //        let ghostedImageView = UIImageView(image: img1)
        //        cell.backgroundView?.addSubview(ghostedImageView)
        //        return cell
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint, to view: UIView) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 1
        //        line.lineJoin = .
        view.layer.addSublayer(line)
    }
}
