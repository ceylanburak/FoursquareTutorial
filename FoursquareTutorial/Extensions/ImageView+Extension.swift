//
//  ImageView+Extension.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(with urlString: String) {
        if let imageFromCache = Constants.imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
        }else {
            download(with: urlString)
        }
    }
    
    fileprivate func download(with urlString: String) {
        guard let url = URL(string: urlString) else {return}

        DispatchQueue.global().async { [weak self] in
            guard let self = self else {return}
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        
//                        self.image = image.resizeImage(targetSize: size)
                        self.image = image
                        Constants.imageCache.setObject(image, forKey: urlString as NSString)
                        
                    }
                }
            }
        }
    }
}
