//
//  MapViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate{
    
    var scrollView:UIScrollView!
    var imageView:UIImageView!
    var backgroundView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.0); // Codigo para mudar a cor da Barra com o Titulo da tela
        
        imageView = UIImageView(image: UIImage(named: "map_full1.png"))
        
        backgroundView = UIView(frame: imageView.frame)
        backgroundView.addSubview(imageView)
        
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        scrollView.contentOffset = CGPoint(x: 1000, y: 450)
        
        scrollView.addSubview(backgroundView)
        view.addSubview(scrollView)
        
        
        
        
        
        scrollView.delegate = self
        
        
        
        setupGestureRecognizer()
        
        setZoomScale()
        self.scrollView.setContentOffset(CGPointMake(187, -100), animated: false)
    }
    
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 0.3
    }
    
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(MapViewController.handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        
        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
            
            
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
            
        } else {
            
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
}

