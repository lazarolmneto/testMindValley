//
//  UIImageView+NetworManager.swift
//
//  Created by Lacir Moraes Neto, Lazaro on 08/06/18.
//

import UIKit

public extension UIImageView {
    
    public func setImage(url: String, thumb: String? = nil, placeHolder: UIImage? = nil, replaceImage: UIImage? = nil) {

        DispatchQueue.main.async {
            self.image = placeHolder
            
            if let thumb = thumb {
                UIImage.loadImage(url: thumb) { (image) in
                    self.image = image
                    UIImage.loadImage(url: url, completion: { (image) in
                        if let image = image {
                            self.image = image
                        } else {
                            self.image = replaceImage
                        }
                    })
                }
            } else {
                UIImage.loadImage(url: url) { (image) in
                    if let image = image {
                        self.image = image
                    } else {
                        self.image = replaceImage
                    }
                }
            }
        }
        
        
    }
}
