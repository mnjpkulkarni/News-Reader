//
//  NewsDetailsVC.swift
//  News Reader
//
//  Created by Manoj Kulkarni on 1/31/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit
import AWSPolly
import AVFoundation
import Firebase

class NewsDetailsVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    var newsDetails: NewsDetails!
    
    var originalConstraint: CGFloat!
    var audioPlayer = AVPlayer()
    var selectedVoice: AWSPollyVoiceId!
    
    var firebaseRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        awsPolly()
        titleLbl.text = newsDetails.title
        firebaseRef = Database.database().reference().child("News")
    }
    
    
    func awsPolly(){
        let task = AWSPolly.default().describeVoices(AWSPollyDescribeVoicesInput())
        self.selectedVoice = AWSPollyVoiceId.emma
        //print(newsDetails.author)
        
        let input = AWSPollySynthesizeSpeechURLBuilderRequest()
        input.text = newsDetails.title
        input.outputFormat = AWSPollyOutputFormat.mp3
        input.voiceId = selectedVoice
        let builder = AWSPollySynthesizeSpeechURLBuilder.default().getPreSignedURL(input)
        
        
        // Request the URL for synthesis result
        builder.continueOnSuccessWith { (awsTask: AWSTask<NSURL>) -> Any? in
            // The result of getPresignedURL task is NSURL.
            // Again, we ignore the errors in the example.
            let url = awsTask.result!
            
            // Try playing the data using the system AVAudioPlayer
            self.audioPlayer.replaceCurrentItem(with: AVPlayerItem(url: url as URL))
            self.audioPlayer.play()
            
            return nil
        }
        

    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let key = firebaseRef.childByAutoId().key
        
        let news = ["id":key,
                    "author":newsDetails.author,
                    "title":newsDetails.title,
                    "url":newsDetails.url,
                    "urlToImage":newsDetails.urlToImage]
        
        firebaseRef.child(key).setValue(news)
    }
}
