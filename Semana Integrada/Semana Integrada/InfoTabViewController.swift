//
//  InfoTabViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class InfoTabViewController : UIViewController {
    z
    
    
    override func viewDidLoad() {
        let storyboard = UIStoryboard(name: "Info", bundle: nil)
        let controller = storyboard.instantiateInitialViewController();
        addChildViewController(controller!);
        view.addSubview(controller!.view);
        controller!.didMoveToParentViewController(self);
    }
    
}
