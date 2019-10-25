//
//  WebViewer.swift
//  FaithLink
//
//  Created by mpc on 10/23/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit
import SafariServices

class WebViewer: UIViewController, SFSafariViewControllerDelegate {

    var documentUrl: String = ""
    var viewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Minutes"
        
        if !documentUrl.isEmpty {
            openUrl(url: documentUrl)
        }
    }
    
    func openUrl(url: String) {
        if let url = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let viewController = SFSafariViewController(url: url, configuration: config)
            viewController.delegate = self
            
            DispatchQueue.main.async {
                self.present(viewController, animated: false)
            }
        } else {
            print("Cannot connect to \(String(describing: url))")
        }
    }
    
    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
        
        //NOTE: ***** This is stubbed in code.  In reality, we want to log
        //URLs that are being redirected.  The administrators can handle
        //the logs and take whatever appropriate steps are necessary.  Replace
        //the code in this method with whatever code is decided upon.
        
        let alert = UIAlertController(title: "",
                                      message: "URL Redirection detected",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
            CATransaction.setCompletionBlock({
                DispatchQueue.main.async {
                    self.viewController = MeetingsViewController()
                    self.navigationController?.present(self.viewController, animated: true, completion: nil)
                }
            })
        })
        
        alert.addAction(okAction)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        viewController = MinutesViewController()
        
        DispatchQueue.main.async {
            self.navigationController?.present(self.viewController, animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
