//
//  ViewController.swift
//  Space Jump (on Single View App)
//
//  Created by  on 1/4/21.
//  Copyright © 2021 ZaCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.image = UIImage(named: "Eagles")
        secondImageView.image = UIImage(named: "76ers")
        secondImageView.isHidden = true
        
        let width = Int(UIScreen.main.bounds.width)
        myImageView.center = CGPoint(x: Int(width / 2), y: 150)
        secondImageView.center = CGPoint(x: Int(width / 2), y: 380)
    }

    @IBAction func imageViewTapped(_ sender: UITapGestureRecognizer) {
        
        let width = Int(UIScreen.main.bounds.width)
        let height = Int(UIScreen.main.bounds.height)
        let randX = Int.random(in: 0..<width)
        let randY = Int.random(in: 0..<height)
        
        UIView.animate(withDuration: 1.0, animations: {
            sender.view?.center = CGPoint(x: randX, y: randY)
        })
        
        sender.view?.center = CGPoint(x: randX, y: randY)
        overlapChecker(imageView1: secondImageView, imageView2: myImageView)
    }
    
    // MARK: Stretch 2
    @IBAction func buttonTapped(_ sender: UIButton) {
        secondImageView.isHidden = false
    }
    
    @IBAction func secondViewTapped(_ sender: UITapGestureRecognizer) {
        
        let width = Int(UIScreen.main.bounds.width)
        let height = Int(UIScreen.main.bounds.height)
        let randX = Int.random(in: 0..<width)
        let randY = Int.random(in: 0..<height)
        
        UIView.animate(withDuration: 1.0, animations: {
            sender.view?.center = CGPoint(x: randX, y: randY)
        })
        
        sender.view?.center = CGPoint(x: randX, y: randY)
        overlapChecker(imageView1: myImageView, imageView2: secondImageView)
    }
    
    // MARK: Stretch 3
    func newImageViewTapped(imageView: UIImageView) {
        let width = Int(UIScreen.main.bounds.width)
        let height = Int(UIScreen.main.bounds.height)
        let randX = Int.random(in: 0..<width)
        let randY = Int.random(in: 0..<height)
        
        UIView.animate(withDuration: 1.0, animations: {
            imageView.center = CGPoint(x: randX, y: randY)
        })
        
        imageView.center = CGPoint(x: randX, y: randY)
    }
    
    @IBAction func spaceJumpButton(_ sender: UIButton) {
        newImageViewTapped(imageView: myImageView)
        newImageViewTapped(imageView: secondImageView)
        overlapChecker(imageView1: myImageView, imageView2: secondImageView)
    }
    
    // MARK: Stretch 4
    func overlapChecker(imageView1: UIImageView, imageView2: UIImageView) {
        while imageView1.frame.intersects(imageView2.frame) {
            newImageViewTapped(imageView: imageView2)
        }
    }
    
    // MARK: Stretch 5
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let width = Int(UIScreen.main.bounds.width)
        UIView.animate(withDuration: 1.0, animations: {
            self.myImageView.center = CGPoint(x: Int(width / 2), y: 150)
            self.secondImageView.center = CGPoint(x: Int(width / 2), y: 380)
        })
    }
    
    
    
}

