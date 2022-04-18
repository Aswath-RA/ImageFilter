//
//  Filters.swift
//  IEditor
//
//  Created by Aswath Ravichandran on 17/04/22.
//

import Foundation
import UIKit
import CoreData

struct Filters {
    
    let filterName : String
    let filterEffectValue : Any?
    let filterEffectValueName : String?
    
    init(filterName:String,filterEffectValue:Any?,filterEffectValueName :String?){
        
        self.filterName = filterName
        self.filterEffectValue = filterEffectValue
        self.filterEffectValueName = filterEffectValueName
    }
    
    static func applyFilterTo(image : UIImage,filterEffect :Filters) -> UIImage? {
        
        guard let cgImage = image.cgImage else {
            return nil
        }
        
        let context = CIContext()
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: filterEffect.filterName)
        
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        
        if let filterEffectValue = filterEffect.filterEffectValue ,let filterEffectValueName = filterEffect.filterEffectValueName {
            
            filter?.setValue(filterEffectValue, forKey:filterEffectValueName)
            
        }
        
        var  filteredImage :UIImage?
        
        if  let  output = filter?.value(forKey: kCIOutputImageKey) as? CIImage , let cgiImageResult = context.createCGImage(output, from: output.extent) {
            filteredImage = UIImage(cgImage: cgiImageResult)
        }
        
        return filteredImage
    }
}
