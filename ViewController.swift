import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dartboard: DartsView!{
        didSet{
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(addPointToDart(_:)))
            tapRecognizer.numberOfTapsRequired = 2
            tapRecognizer.numberOfTouchesRequired = 1
            dartboard.addGestureRecognizer(tapRecognizer)
	    dartboard.canDrawPoint = true
            
            let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(increaseScale(gesture:)))
            dartboard.addGestureRecognizer(pinchRecognizer)
            
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(gesture:)))
            swipeDownRecognizer.direction = .down
            swipeDownRecognizer.numberOfTouchesRequired = 1
            
            dartboard.addGestureRecognizer(swipeDownRecognizer)
            
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp(_:)))
            swipeUpRecognizer.numberOfTouchesRequired = 1
            swipeUpRecognizer.direction = .up
            dartboard.addGestureRecognizer(swipeUpRecognizer)
        }
    }
    
    func swipeUp(_ sender: UISwipeGestureRecognizer) {
        switch sender.state{
        case .recognized:
            dartboard.circles += 1
        case .failed: fallthrough
        default:
            return
        }
    }

    func swipeDown(gesture: UISwipeGestureRecognizer){
        switch gesture.state{
        case .recognized:
            dartboard.circles -= 1
        case .failed: fallthrough
        default:
            return
        }
    }
    
    func increaseScale(gesture: UIPinchGestureRecognizer){
        let newScale = gesture.scale
        dartboard.scale = newScale
    }
    
    func addPointToDart(_ gesture: UITapGestureRecognizer){
        let point = gesture.location(in: dartboard)
        dartboard.point = point
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

