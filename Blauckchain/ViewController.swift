//
//  ViewController.swift
//  Blauckchain
//
//  Created by Frank Blau on 11/27/18.
//  Copyright © 2018 Frank Blau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentBlock : Int = 0
    
    struct qBlock {
        var qId : Int!
        var qQuestionText : String!
        var rText1 : String!
        var rDest1 : Int!
        var rHide1 : Bool!
        var rText2 : String!
        var rDest2 : Int!
        var rHide2 : Bool!
    }
    
    var qBlocks: [qBlock] = [
        qBlock(qId: 0, qQuestionText: "Do you need a database?", rText1: "Yes", rDest1: 2, rHide1: false, rText2: "No", rDest2: 9, rHide2: false),
        qBlock(qId: 1, qQuestionText: "Does it require shared write access?", rText1: "Yes", rDest1: 3, rHide1: false, rText2: "No", rDest2: 9, rHide2: false),
        qBlock(qId: 2, qQuestionText: "Are all of the writers known and trusted?", rText1: "Yes", rDest1: 6, rHide1: false, rText2: "No", rDest2: 4, rHide2: false),
        qBlock(qId: 3, qQuestionText: "Do you want/need to use a trusted 3rd party?", rText1: "Yes", rDest1: 9, rHide1: false, rText2: "No", rDest2: 5, rHide2: false),
        qBlock(qId: 4, qQuestionText: "Do you need to control functionality?", rText1: "Yes", rDest1: 8, rHide1: false, rText2: "No", rDest2: 7, rHide2: false),
        qBlock(qId: 5, qQuestionText: "Are writers interests unified?", rText1: "Yes", rDest1: 9, rHide1: false, rText2: "No", rDest2: 4, rHide2: false),
        qBlock(qId: 6, qQuestionText: "Do you want transactions to be private or public?", rText1: "Private", rDest1: 8, rHide1: false, rText2: "Public", rDest2: 10, rHide2: false),
        qBlock(qId: 7, qQuestionText: "Where is conssensus determined?", rText1: "Intrafirm", rDest1: 12, rHide1: false, rText2: "Interfirm", rDest2: 11, rHide2: false),
        qBlock(qId: 8, qQuestionText: "Don't use Blockchain", rText1: "Start Over", rDest1: 1, rHide1: false, rText2: "", rDest2: 1, rHide2: true),
        qBlock(qId: 9, qQuestionText: "Use a Public Blockchain", rText1: "Start Over", rDest1: 1, rHide1: false, rText2: "", rDest2: 1, rHide2: true),
        qBlock(qId: 10, qQuestionText: "Use a Hybrid Blockchain", rText1: "Start Over", rDest1: 1, rHide1: false, rText2: "", rDest2: 1, rHide2: true),
        qBlock(qId: 11, qQuestionText: "Use a Private Blockchain", rText1: "Start Over", rDest1: 1, rHide1: false, rText2: "", rDest2: 1, rHide2: true),
    ]
    
    @IBOutlet weak var qText: UITextView!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    
    var newBlock : Int = 0
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            newBlock = qBlocks[currentBlock].rDest1-1
        } else
        if sender.tag == 2 {
            newBlock = qBlocks[currentBlock].rDest2-1
        }
        nextQuestion(newBlock: newBlock)
    }
    
    func nextQuestion(newBlock : Int) {
        qText.text = qBlocks[newBlock].qQuestionText
        b1.setTitle(qBlocks[newBlock].rText1, for: .normal)
        b2.setTitle(qBlocks[newBlock].rText2, for: .normal)
        b1.isHidden = qBlocks[newBlock].rHide1
        b2.isHidden = qBlocks[newBlock].rHide2
        currentBlock = qBlocks[newBlock].qId
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion(newBlock: 0)
    }
}

