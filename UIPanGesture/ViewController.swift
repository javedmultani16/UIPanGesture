//
//  ViewController.swift
//  UIPanGesture
//
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewDrag: UIView!
    var panGesture = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
        viewDrag.isUserInteractionEnabled = true
        viewDrag.addGestureRecognizer(panGesture)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: viewDrag)
        let translation = sender.translation(in: self.view)
        viewDrag.center = CGPoint(x: viewDrag.center.x + translation.x, y: viewDrag.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}

