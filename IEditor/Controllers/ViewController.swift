//
//  ViewController.swift
//  IEditor
//
//  Created by Aswath Ravichandran on 13/04/22.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toBlurButton: UIButton!
    @IBOutlet weak var toFalseColorButton: UIButton!
    @IBOutlet weak var toSepiaToneButton: UIButton!
    @IBOutlet weak var toVintageButton: UIButton!
    @IBOutlet weak var toNoirButton: UIButton!
    @IBOutlet weak var ImageClear: UIButton!
    
    private var originalImage:UIImage?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        originalImage = imageView.image
        buttonResize()
    }
    
    //to resize all button
    func buttonResize() {
        
        toBlurButton.ToRound()
        toNoirButton.ToRound()
        toFalseColorButton.ToRound()
        toVintageButton.ToRound()
        toSepiaToneButton.ToRound()
        ImageClear.ToRound()
    }
    
    @IBAction func toBlurButton(_ sender: Any) {
        
        if let image = imageView.image {
            
            imageView.image = Filters.applyFilterTo(image: image, filterEffect: Filters(filterName:"CIDiscBlur", filterEffectValue: nil, filterEffectValueName:nil ))
        }
        
        
    }
    @IBAction func toFalseColorButton(_ sender: Any) {
        
        if let image = imageView.image {
            
            imageView.image = Filters.applyFilterTo(image: image, filterEffect: Filters(filterName:"CIFalseColor", filterEffectValue: nil, filterEffectValueName:nil ))
        }
        
    }
    
    
    @IBAction func toSepiaToneButton(_ sender: Any) {
        
        if let image = imageView.image {
            
            imageView.image = Filters.applyFilterTo(image: image, filterEffect: Filters(filterName:"CISepiaTone", filterEffectValue: 0.90, filterEffectValueName:kCIInputIntensityKey
                                                                                       ))
        }
    }
    
    @IBAction func toNoirButton(_ sender: Any) {
        
        if let image = imageView.image {
            
            imageView.image = Filters.applyFilterTo(image: image, filterEffect: Filters(filterName:"CIPhotoEffectNoir", filterEffectValue: nil, filterEffectValueName:nil ))
        }
    }
    @IBAction func toVintageButton(_ sender: Any) {
        
        if let image = imageView.image {
            
            imageView.image = Filters.applyFilterTo(image: image, filterEffect: Filters(filterName:"CIPhotoEffectProcess", filterEffectValue: nil, filterEffectValueName:nil ))
        }
    }
    
    @IBAction func ImageClear(_ sender: Any) {
        imageView.image = originalImage
        
    }
}

extension UIButton {
    func ToRound(){
        self.layer.cornerRadius = self.frame.size.width/8
        self.clipsToBounds = true
    }
}

