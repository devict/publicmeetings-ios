//
//  Line.swift
//  publicmeetings-ios
//
//  Created by mpc on 1/11/20.
//  Copyright © 2020 mpc. All rights reserved.
//

import UIKit

class Line: UIView  {
    var origin: CGPoint = CGPoint(x: 0, y: 0)
    var destination: CGPoint = CGPoint(x: 0, y: 0)
    var width: CGFloat = 0.0
    var color: UIColor = .clear

    override public init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //TODO: Pass in the line parameters.  Values are hard-coded for testing purposes

    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(width)
        context.setStrokeColor(color)
        context.move(to: origin)
        context.addLine(to: destination)
        context.strokePath()
    }

    private setLineWidth(width: CGFloat) {
        self.width = width
    }

    private func setOrigin(origin: CGPoint) {
        self.origin = origin
    }

    private func setDestination(destination: CGPoint) {
        self.destination = destination
    }

    private func setLine(from: CGPoint, to: CGPoint) {
        setOrigin(origin: from)
        setDestination(destination: to)
    }
}
