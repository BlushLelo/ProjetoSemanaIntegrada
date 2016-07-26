//
//  SplashScreenAnimation.swift
//  Semana Integrada
//
//  Created by vntlab on 7/26/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class SplashScreenAnimation: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
      let w =  UIScreen.mainScreen().bounds.height
       let h =  UIScreen.mainScreen().bounds.width
        
        let frame = CGRectMake(0,0,h,w)//dimensoes da splash
        
        var splashScreem:UIImageView = UIImageView(frame: frame)// variavel pra splash do tipo UIImageView
        
        var images = [UIImage]()//crio um vetor vazio de IMAGES
        
        for i in 14...71{
            
            let image = UIImage(named: "vinheta_000"+String(i)+".jpg")
            images.append(image!)//joga minhas imagens no meu vetor
            
        }
        
        splashScreem.animationImages = images//joga as imagens para a animação
        
        splashScreem.animationDuration = 3.5//duração da splashscreen
        
        splashScreem.animationRepeatCount = 1//repetoção da animação
        
     
        
        self.view.addSubview(splashScreem)//adiciona a view
        
        splashScreem.startAnimating()//começa animação
        
        
        
        self.performSelector("nextView", withObject: splashScreem, afterDelay: 6)//seleciono uma view para a animação, depois vai para a atividades
        
        

    }
    
    
    func nextView(){//função que manda seguir para minha view após a splasScreen
        
        self.performSegueWithIdentifier("nextViewSegue", sender: nil)
        
    }

}
