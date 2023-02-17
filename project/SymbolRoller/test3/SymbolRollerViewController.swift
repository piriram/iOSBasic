//
//  SymbolRollerViewController.swift
//  test3
//
//  Created by ram on 2023/02/13.
//
//q.함수 3개 찾기
//_ 이게 뭔지
import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols: [String] = ["sun.min","moon","cloud","wind"
    ,"snowflake"]

    //버튼이 눌릴 때 변화
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {//view component들이 실제로 메모리에 로드된 시점
        
        // TO-DO:
        // - 심볼에서 하나를 임의로 추출해서
        // - 이미지와 텍스트 설정을 한다.
        // DRY
        // DO NOT REPEAT YOURSELF
        // 중복된 코드를 보면 참지 마라
        // 중복된 코드를 바꿔야한다면 일이 2배!
        super.viewDidLoad()
        
        print("view did load")
        reload()

    }
    //viewcontroller도 라이프사이클이 존재
    //화면에 나타날 준비가 되면
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("눌렸다")
        //let beforeSymbol:String = symbol
//        let symbol = symbols.randomElement()!
//        imageView.image = UIImage(systemName:
//        symbol)
//        while symbol==beforeSymbol {
//            symbol = symbols.randomElement()!
//            imageView.image = UIImage(systemName: symbol)
//        }
        //label.text=symbol
        reload() 
    }
    
    func reload() {
        let symbol = symbols.randomElement()!
        //확실하게 있다는..널이아니라는..강제언랩핑
        //왜냐하면 symbol이 물음표였기때문
        imageView.image = UIImage(systemName:
        symbol)
        label.text = symbol
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
