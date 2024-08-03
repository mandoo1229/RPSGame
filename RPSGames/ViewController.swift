//
//  ViewController.swift
//  RPSGames
//
//  Created by 남민우 on 7/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 변수 /속성
    @IBOutlet weak var mainLable: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice: Rps = Rps.rock
    
    
    
    
    //함수 / 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 첫번째 / 두번째 이미지뷰에 준비(묵) 이미지를 띄워야함
        
        // 2) 첫번째 / 두번째 레이블에 "준비"라고 문자열을 띄워야함
        
        
        comImageView.image = #imageLiteral(resourceName: "rock")
        myImageView.image = #imageLiteral(resourceName: "rock")
        
        
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위 / 바위 / 보를 선택해서 그 정보를 저장해야함.
        let title = sender.currentTitle!
        print(title)
        
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지 뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 에비르에 표시
        switch comChoice{
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 3) 내가 선택한 것을 레이블에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        switch myChoice{
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/ 졌는지 판단/ 표시
        
        if comChoice == myChoice {
            mainLable.text = "비겼습니다."
        } else if comChoice == .rock  && myChoice == .paper {
            mainLable.text = "이겼습니다."
        } else if comChoice == .scissors && myChoice == .rock {
            mainLable.text = "이겼습니다."
        } else if comChoice == .paper && myChoice == .scissors {
            mainLable.text = "이겼습니다."
        } else {
            mainLable.text = "졌습니다."
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 다시 준비 이미지뷰에 표시
        // 2) 컴퓨터가 디시 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        // 3) 내 선택 이미지뷰에도 준비 이미지를 표시
        // 4) 내 선택 레이블에도 준비 문자열 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 5) 메인 레이블에 "선택하세요" 표시
        mainLable.text = "선택하세요"
        
        // 6) 컴퓨터가 다시 랜덤 가위 바위 보를 선택
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
    }
    
}
