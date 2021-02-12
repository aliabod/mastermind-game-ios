//
//  PopupMessage.swift
//
//  Assignment 1 - COMP228
//  Ali Abod
//  ID: 201267800
//
//  Created by Ali Abod on 09/11/2019.
//  Copyright © 2019 Ali Abod. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Pop-Up Message Function
    // Modified from StackOverflow
    func show(message: String, okText: String, completion: (() -> Void)? = nil) {
        let controller = UIAlertController(
            title: message,
            message: nil,
            preferredStyle: .alert
        )
        
        let doneAction = UIAlertAction(
            title: okText,
            style: .default,
            handler: { _ in
                DispatchQueue.main.async {
                    completion?()
                }
        })
        controller.addAction(doneAction)
        present(controller, animated: false)
    }
}
    
