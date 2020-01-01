//
//  AboutView.swift
//  publicmeetings-ios
//
//  Created by mpc on 10/28/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

class AboutView: UIView {
    
    var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "meetingroom")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var aboutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "About The Meeting Project"
        label.textColor = .white
        label.font = Standard.fontBold
        label.textAlignment = .center
        return label
    }()
    
    var about: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font = Standard.systemFont
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    var byLineView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkRed")
        return view
    }()
    
    var byLine: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .white
        label.text = "2019 Public Meetings.  Developed by DevICT.  All Rights Reserved."
        label.textAlignment = .center
        label.font = Standard.systemFontSmall
        return label
    }()
    

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Setup and Layout
    private func setupView() {
        [logo, aboutLabel, about, byLineView].forEach { addSubview($0) }
        byLineView.addSubview(byLine)
        about.text = loremIpsum()
    }
    
    private func setupLayout() {
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: topAnchor),
            logo.leadingAnchor.constraint(equalTo: leadingAnchor),
            logo.trailingAnchor.constraint(equalTo: trailingAnchor),
            logo.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            aboutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25.0),
            aboutLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            aboutLabel.heightAnchor.constraint(equalToConstant: 25.0),
            
            about.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 2.0),
            about.leadingAnchor.constraint(equalTo: leadingAnchor),
            about.trailingAnchor.constraint(equalTo: trailingAnchor),
            about.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25.0),
            
            byLineView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            byLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            byLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            byLineView.heightAnchor.constraint(equalToConstant: 25.0),
            
            byLine.centerXAnchor.constraint(equalTo: byLineView.centerXAnchor),
            byLine.centerYAnchor.constraint(equalTo: byLineView.centerYAnchor),
            byLine.widthAnchor.constraint(equalToConstant: Screen.width)
        ])
    }
    
    func loremIpsum() -> String {
        var lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam etiam erat velit scelerisque in dictum non. Pellentesque nec nam aliquam sem et tortor consequat id. Nulla facilisi cras fermentum odio eu feugiat pretium. Gravida quis blandit turpis cursus in. Aenean sed adipiscing diam donec adipiscing tristique risus. Purus in mollis nunc sed. Euismod in pellentesque.\n\n"

        lorem += "Amet mattis vulputate enim nulla. Nibh tellus molestie nunc non blandit massa enim. Pulvinar sapien et ligula ullamcorper malesuada. Mi quis hendrerit dolor magna eget est lorem ipsum. Sagittis vitae et leo duis ut diam. Bibendum ut tristique et egestas quis ipsum suspendisse. Ultrices mi tempus imperdiet nulla. Sodales ut etiam sit amet nisl purus in mollis. Velit euismod in pellentesque massa placerat duis ultricies lacus. Sem fringilla ut morbi tincidunt augue interdum velit euismod. Rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Sed risus pretium quam vulputate dignissim suspendisse in est ante. Duis at consectetur lorem donec massa sapien faucibus. Vivamus at augue eget arcu dictum varius duis at. Magna etiam tempor orci eu lobortis elementum nibh.\n\n"
        
        return lorem
    }
}
