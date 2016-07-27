//
//  splashScreenAnimation.swift
//  Semana Integrada
//
//  Created by vntlab on 7/27/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class SplashScreenAnimation: UIViewController {
    
    
    
    @IBOutlet weak var imageSplashScreen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var images = [UIImage]()//crio um vetor vazio de IMAGES
        
        for i in 14...71{
            
            let image = UIImage(named: "vinheta_000"+String(i)+".jpg")
            images.append(image!)//joga minhas imagens no meu vetor
            
        }
        
        
       imageSplashScreen.animationImages = images//joga as imagens para a animação
        
        imageSplashScreen.animationDuration = 3.5//duração da splashscreen
        
        imageSplashScreen.animationRepeatCount = 1//repetoção da animação
        
        imageSplashScreen.image = UIImage (named: "vinheta_00071.jpg")
        
        
      
        
        imageSplashScreen.startAnimating()//começa animação
        
       
        
        
        
        
    self.performSelector("nextView", withObject: imageSplashScreen, afterDelay: 6)//seleciono uma view para a animação, depois vai para a atividades
        
        
        
    }
    
    
    func nextView(){//função que manda seguir para minha view após a splasScreen
        
        self.performSegueWithIdentifier("nextViewSegue", sender: nil)
        
    }
    
}