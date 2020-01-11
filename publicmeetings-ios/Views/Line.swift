//
//  Line.swift
//  publicmeetings-ios
//
//  Created by mpc on 1/11/20.
//  Copyright © 2020 mpc. All rights reserved.
//

import UIKit

class Line: UIView  {

    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 480))
        backgroundColor = .white
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //TODO: Pass in the line parameters.  Values are hard-coded for testing purposes

    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.systemGray3.cgColor)
        context.move(to: CGPoint(x: 30, y: 100))
        context.addLine(to: CGPoint(x: 230, y: 100))
        context.strokePath()
    }
}
