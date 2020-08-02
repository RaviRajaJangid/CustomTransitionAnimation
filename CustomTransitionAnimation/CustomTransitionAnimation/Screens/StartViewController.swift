//
//  StartViewController.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 30/07/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var buttonStart: UIButton! {
        didSet {
            buttonStart.backgroundColor = AppColor.Brown
            buttonStart.setTitleColor(.white, for: .normal)
            buttonStart.titleLabel?.font = UIFont.Ubantu(.regular, size: 17)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonStart.addShadow(shadowOffset: CGSize(width: 0, height: 5))
        buttonStart.layer.cornerRadius =  buttonStart.frame.size.height/2
    }
}
