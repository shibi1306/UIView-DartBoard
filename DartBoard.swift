import UIKit
@IBDesignable
class DartsView: UIView {
    @IBInspectable var circles: UInt = 5 { didSet{ setNeedsDisplay() }}
    @IBInspectable var scale: CGFloat = 0.9 { didSet{ setNeedsDisplay() }}
    @IBInspectable var backColor: UIColor = UIColor.white { didSet{ setNeedsDisplay() }}
    @IBInspectable var radiusDifference: UInt = 11 { didSet{ setNeedsDisplay() }}
    @IBInspectable var lineWidth: CGFloat = 3.0 { didSet{ setNeedsDisplay() }}
    @IBInspectable var lineColor: UIColor = UIColor.black { didSet{ setNeedsDisplay() }}
    @IBInspectable var bullsEye: UIColor = UIColor.black { didSet{ setNeedsDisplay() }}
    
    private var dartOuterRadius: CGFloat{
        return min(bounds.width, bounds.height) / 2 * scale
    }
    private var dartCenter: CGPoint{
        return convert(center, from: superview)
    }
    private func setProperties(forObject object: inout UIBezierPath){
        lineColor.setStroke()
        object.lineWidth = lineWidth
    }
    private func drawCircle(number: UInt) -> UIBezierPath{
        let radius = CGFloat(dartOuterRadius - CGFloat(radiusDifference * number))
        return UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat(Double.pi), clockwise: true)
    }
    private func drawDart(){
        for i in 0 ..< circles{
            var object = drawCircle(number: i)
            setProperties(forObject: &object)
            i == circles - 1 ? bullsEye.setFill() : backColor.setFill()
            object.fill()
            object.stroke()
        }
    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        drawDart()
    }

}

