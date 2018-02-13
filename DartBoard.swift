import UIKit
@IBDesignable
class DartsView: UIView {
    @IBInspectable var circles: UInt = 6 { didSet{ setNeedsDisplay() }}
    @IBInspectable var scale: CGFloat = 0.9 { didSet{ setNeedsDisplay() }}
    @IBInspectable var backColor: UIColor = UIColor.black { didSet{ setNeedsDisplay() }}
    @IBInspectable var radiusDifference: UInt = 22 { didSet{ setNeedsDisplay() }}
    @IBInspectable var lineWidth: CGFloat = 3.0 { didSet{ setNeedsDisplay() }}
    @IBInspectable var lineColor: UIColor = UIColor.darkGray { didSet{ setNeedsDisplay() }}
    @IBInspectable var bullsEye: UIColor = UIColor.black { didSet{ setNeedsDisplay() }}
    
    var canDrawPoint: Bool = false
    @IBInspectable var pointSize: CGFloat = 3.0 { didSet{ setNeedsDisplay() }}
    @IBInspectable var pointColor: UIColor = UIColor.red { didSet{ setNeedsDisplay() }}
    var point: CGPoint = CGPoint(x: 0.0, y: 0.0) { didSet{ setNeedsDisplay() }}
    
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
    private func radiusOfCircleWithNumber(_ number: UInt) -> CGFloat{
        return CGFloat(dartOuterRadius - CGFloat(radiusDifference * number))
    }
    func drawPoint(){
        let dartPoint = drawCircleOf(radius: pointSize, center: point)
        dartPoint.move(to: point)
        pointColor.set()
        dartPoint.stroke()
        dartPoint.fill()
    }
    private func drawCircleOf(radius: CGFloat, center: CGPoint) -> UIBezierPath{
        return UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat(Double.pi), clockwise: true)
    }
    private func drawDart(){
        for i in 0 ..< circles{
            let radius = radiusOfCircleWithNumber(i)
            guard radius > 0 else{
                return
            }
            var object = drawCircleOf(radius: radius, center: dartCenter)
            setProperties(forObject: &object)
            i == circles - 1 ? bullsEye.setFill() : backColor.setFill()
            object.fill()
            object.stroke()
        }
    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        drawDart()
        if(canDrawPoint){
            drawPoint()
        }
    }

}
