//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by ram on 2023/02/14.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var cityLable: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var temperatureLable: UILabel!
    
    let cities = ["Seoul", "Tokyo", "LA","Seattle" ]
    let weathers = ["cloud.fill",
    "sun.max.fill","wind","cloud.sun.rain.fill"
    ]
     
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        cityLable.text = cities.randomElement()
        
        let imageName = weathers.randomElement()!
        
        weatherImageView.image =
        UIImage(systemName:
                    imageName)?.withRenderingMode(.alwaysOriginal)
        //색상을 렌더링 모드로 하자
        //템플릿 모드로 하면 지정색상만 나옴
        let randomTemp = Int.random(in:10..<30)
        //10에서 30 사이
        temperatureLable.text = "\(randomTemp)°"
        
        print("도시, 온도, 날씨 이미지 변경하자!")
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
