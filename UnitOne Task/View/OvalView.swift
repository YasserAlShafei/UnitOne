
import Foundation
import UIKit


@IBDesignable
class OvalView: UILabel {
    var topLeft: Bool = true {
        didSet {
            layoutSubviews()
        }
    }
    var topRight: Bool = true {
        didSet {
            layoutSubviews()
        }
    }
    var bottomLeft: Bool = true {
        didSet {
            layoutSubviews()
        }
    }
    var bottomRight: Bool = true {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var corners : UIRectCorner = [];
        if (topLeft){
          corners.insert(.topLeft);
        }
        if (topRight){
          corners.insert(.topRight)
        }
        if (bottomLeft){
          corners.insert(.bottomLeft);
        }
        if (bottomRight){
          corners.insert(.bottomRight);
        }
        self.roundCorners(corners, radius: self.radius);
    }
}


