//
//  AncherHelper.swift
//  IvanApp
//
//  Created by Klaus Jakobsen on 25/04/2018.
//  Copyright © 2018 Schneider Electric. All rights reserved.
//

import Foundation
import UIKit

public class UIFactory {
    public static func createBtnForAuthentication(parent: UIView, text: String) -> UIButton {
        let button = UIButton()
        parent.addSubview(button)
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.authBtnColorGreen()
        button.tintColor = .white
        return button
    }
    
    public static func createMultilineLabel(parent: UIView, text: String) -> UILabel {
        let label = UILabel()
        parent.addSubview(label)
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }
    
    public static func createSubTitleLabel(parent: UIView, text: String) -> UILabel {
        let label = UILabel()
        parent.addSubview(label)
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = Colors.white()
        return label
    }
    
    public static func createLargeTitle(parent: UIView, text: String) -> UILabel {
        let label = UILabel()
        parent.addSubview(label)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = Colors.white()
        return label
    }
    
    public static func createMediumTitle(parent: UIView, text: String) -> UILabel {
        let label = UILabel()
        parent.addSubview(label)
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }
    
    public static func createXLTitleLabel(parent: UIView, text: String) -> UILabel {
        let label = UILabel()
        parent.addSubview(label)
        label.text = text
        label.textColor = Colors.titleColor()
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }
    
    public static func createWhiteCornerButton(parent: UIView, text: String) -> UIButton {
        return createButtonWithRoundBorder(parent: parent, text: text, backgroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.65), foregroundColor: Colors.widgetGreen)
    }
    
    public static func createButtonWithRoundBorder(parent: UIView, text: String, backgroundColor: UIColor, foregroundColor: UIColor) -> UIButton {
        let button = UIButton()
        parent.addSubview(button)
        
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = backgroundColor
        button.tintColor = .red
        button.setTitleColor(foregroundColor, for: .normal)
        
        return button
    }
    
    public static func createBtnWithImage(parent: UIView, image: UIImage, color: UIColor = UIColor.clear) -> UIButton {
        let button = UIButton()
        parent.addSubview(button)
        button.setImage(image, for: .normal)
        return button
    }
    
    public static func createUIView(parent: UIView) -> UIView {
        let view = UIView()
        parent.addSubview(view)
        return view
    }
    
    public static func createImage(parent: UIView, image: UIImage?) -> UIImageView {
        let imageView = UIImageView(image: image)
        parent.addSubview(imageView)
        #if swift(>=4.2)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        #else
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        #endif
        
        return imageView
    }
    
    public static func createImage(parent: UIView, named: String) -> UIImageView {
        let image = UIImage(named: named)
        let imageView = UIImageView(image: image)
        parent.addSubview(imageView)
        #if swift(>=4.2)
            imageView.contentMode = UIView.ContentMode.scaleAspectFit
        #else
            imageView.contentMode = UIViewContentMode.scaleAspectFit
        #endif

        return imageView
    }

    
    public static func createBlurView(parent: UIView, alpha: CGFloat = 0.5) -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = alpha
        parent.addSubview(view)
        return view
    }
}

fileprivate enum ConstraintIdentifiers: String  {
    case MARGIN_RIGHT = "ConstraintIdentifiers_MARGIN_RIGHT"
    case MARGIN_LEFT = "ConstraintIdentifiers_MARGIN_LEFT"
    case MARGIN_TOP = "ConstraintIdentifiers_MARGIN_TOP"
    case MARGIN_BOTTOM = "ConstraintIdentifiers_MARGIN_BOTTOM"
    case HEIGHT = "ConstraintIdentifiers_HEIGHT"
    case WIDTH = "ConstraintIdentifiers_WIDTH"
    case LEFT_FROM = "ConstraintIdentifiers_LEFT_FROM"
    case RIGHT_FROM = "ConstraintIdentifiers_RIGHT_FROM"
    case TOP_FROM = "ConstraintIdentifiers_TOP_FROM"
    case BOTTOM_FROM = "ConstraintIdentifiers_BOTTOM_FROM"
}

extension UIView {
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return self.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return self.rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
    
    @discardableResult
    public func anchorCenterSuperview() -> UIView {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
        return self
    }
    
    @discardableResult
    public func anchorCenterXToSuperview(constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func anchorCenterYToSuperview(constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func anchorCenterXToView(view: UIView, constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func anchorCenterYToView(view: UIView, constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func anchorCenterToView(view: UIView) -> UIView {
        anchorCenterXToView(view: view)
        anchorCenterYToView(view: view)
        return self
    }
    
    @discardableResult
    public func anchorFillSuperview() -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.safeLeftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.safeRightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.safeTopAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.safeBottomAnchor).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func marginLeftFromView(margin: CGFloat, view: UIView) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leftAnchor.constraint(equalTo: view.safeRightAnchor, constant: margin)
        constraint.isActive = true
        constraint.identifier = ConstraintIdentifiers.LEFT_FROM.rawValue
        return self
    }
    
    @discardableResult
    public func marginTopFromView(margin: CGFloat, view: UIView) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: view.safeBottomAnchor, constant: margin)
        constraint.isActive = true
        constraint.identifier = ConstraintIdentifiers.TOP_FROM.rawValue

        return self
    }
    
    @discardableResult
    public func marginRightFromView(margin: CGFloat, view: UIView) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = rightAnchor.constraint(equalTo: view.safeLeftAnchor, constant: margin)
        constraint.isActive = true
        constraint.identifier = ConstraintIdentifiers.RIGHT_FROM.rawValue
        return self
    }
    
    @discardableResult
    public func marginBottomFromView(margin: CGFloat, view: UIView) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: view.safeTopAnchor, constant: margin)
        constraint.isActive = true
        constraint.identifier = ConstraintIdentifiers.BOTTOM_FROM.rawValue

       
        return self
    }
    
    @discardableResult
    public func marginFromView(left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat, view: UIView) -> UIView {
        marginLeftFromView(margin: left, view: view)
        marginTopFromView(margin: top, view: view)
        marginRightFromView(margin: right, view: view)
        marginBottomFromView(margin: bottom, view: view)
        return self
    }
    
    @discardableResult
    public func marginLeft(_ margin: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let constraint = leftAnchor.constraint(equalTo: superview.safeLeftAnchor, constant: margin)
            constraint.isActive = true
            constraint.identifier = ConstraintIdentifiers.MARGIN_LEFT.rawValue
       }
        
        assert(superview != nil)

        return self
    }
    
    @discardableResult
    public func marginTop(_ margin: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let constraint = topAnchor.constraint(equalTo: superview.safeTopAnchor, constant: margin)
            constraint.isActive = true
            constraint.identifier = ConstraintIdentifiers.MARGIN_TOP.rawValue
        }
        return self
    }
    
    @discardableResult
    public func marginRight(_ margin: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let constraint = rightAnchor.constraint(equalTo: superview.safeRightAnchor, constant: margin)
            constraint.isActive = true
            constraint.identifier = ConstraintIdentifiers.MARGIN_RIGHT.rawValue
        }
        
        return self
    }
    
    private func getConstraint(view: UIView, identifier: String) -> NSLayoutConstraint? {
        let match = view.constraints.first( where: {
            if let constraintView = $0.firstItem as? UIView, constraintView == self, let constraintIdentier = $0.identifier, constraintIdentier == identifier {
                return true
            } else {
                return false
            }
        })
        
        #if DEBUG
        if match != nil {
            //Can be removed later, just to be sure we only have one constraint, since self.constraints is the constraint tree
            
            let matches = view.constraints.filter({
                if let constraintView = $0.firstItem as? UIView, constraintView == self, let constraintIdentier = $0.identifier, constraintIdentier == identifier {
                    return true
                } else {
                    return false
                }
            })
            
            assert(matches.count <= 1)
        }
        #endif
        
        return match
    }
    
    private func getConstraint(_ identifier: String) -> NSLayoutConstraint {
        var match = getConstraint(view: self, identifier: identifier)
        
        if match == nil, let parent = self.superview {
            match = getConstraint(view: parent, identifier: identifier)
        }
        
        assert(match != nil)
       
        return match ?? NSLayoutConstraint()
    }

    @discardableResult
    public func marginBottom(_ margin: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let constraint = bottomAnchor.constraint(equalTo: superview.safeBottomAnchor, constant: margin)
            constraint.isActive = true
            constraint.identifier = ConstraintIdentifiers.MARGIN_BOTTOM.rawValue

        }
        return self
    }
    
    @discardableResult
    public func margin(left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) -> UIView {
        marginLeft(left)
        marginTop(top)
        marginRight(right)
        marginBottom(bottom)
        return self
    }
    
    @discardableResult
    public func ancherSize(width: CGFloat, height: CGFloat) -> UIView {
        return setWidth(width).setHeight(height)
    }
    
    @discardableResult
    public func setWidth(_ width: CGFloat) -> UIView  {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.isActive = true
        constraint.identifier = ConstraintIdentifiers.WIDTH.rawValue
        return self
    }
    
    @discardableResult
    public func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = heightAnchor.constraint(equalToConstant: height)
        heightConstraint.isActive = true
        heightConstraint.identifier = ConstraintIdentifiers.HEIGHT.rawValue
        return self
    }
    
    public func getMarginLeftContraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.MARGIN_LEFT.rawValue)
    }
    
    public func getMarginRigtContraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.MARGIN_RIGHT.rawValue)
    }
    
    public func getMarginTopContraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.MARGIN_TOP.rawValue)
    }
    
    public func getMarginBottomContraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.MARGIN_BOTTOM.rawValue)
    }

    public func getHeightContraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.HEIGHT.rawValue)
    }
    
    public func getWidthContraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.WIDTH.rawValue)
    }
    
    public func getMarginBottomFromViewConstraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.BOTTOM_FROM.rawValue)
    }
    
    public func getMarginTopFromViewConstraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.TOP_FROM.rawValue)
    }
    
    public func getMarginLeftFromViewConstraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.LEFT_FROM.rawValue)
    }
    
    public func getMarginRigthFromViewConstraint() -> NSLayoutConstraint {
        return getConstraint(ConstraintIdentifiers.RIGHT_FROM.rawValue)
    }
    
    func setCornerRadius(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    public func startGradientAnimation() {
        let backgroundGradientLayer = CAGradientLayer()

        let from = Colors.gradiantFrom
        let to = Colors.gradiantTo
        var toColors: [AnyObject] = [from.cgColor, to.cgColor]
        backgroundGradientLayer.frame = CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height)
        backgroundGradientLayer.colors = toColors
        backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.0)
        backgroundGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        backgroundGradientLayer.locations = [0.0, 0.6]
        backgroundGradientLayer.cornerRadius = 4
        
        layer.addSublayer(backgroundGradientLayer)
        
        let gradientChangeLocation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.locations))
        gradientChangeLocation.duration = 1
        gradientChangeLocation.toValue = [0.0, 0.6]
        #if swift(>=4.2)
        gradientChangeLocation.fillMode = CAMediaTimingFillMode.forwards
        #else
        gradientChangeLocation.fillMode = kCAFillModeForwards
        #endif
        gradientChangeLocation.isRemovedOnCompletion = false
        backgroundGradientLayer.add(gradientChangeLocation, forKey: "locationsChange")
        
        let gradientChangeColor = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.colors))
        gradientChangeColor.duration = 2
        gradientChangeColor.fromValue = toColors.reverse()
        gradientChangeColor.toValue = toColors
        #if swift(>=4.2)
        gradientChangeColor.fillMode =  CAMediaTimingFillMode.forwards
        #else
        gradientChangeColor.fillMode = kCAFillModeForwards
        #endif
        gradientChangeColor.isRemovedOnCompletion = false
        gradientChangeColor.autoreverses = true
        gradientChangeColor.repeatCount = .infinity
        backgroundGradientLayer.add(gradientChangeColor, forKey: "colorChange")
    }
    
    public func stopGradientAnimation() {
        if let subLayers = layer.sublayers {
            for subLayer in subLayers {
                if subLayer is CAGradientLayer {
                    subLayer.removeFromSuperlayer()
                }
            }
        }
    }
}
