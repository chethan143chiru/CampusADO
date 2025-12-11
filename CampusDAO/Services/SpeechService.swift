//
//  SpeechService.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Speech
import Combine

class SpeechService: NSObject, ObservableObject {
    @Published var transcript: String = ""
    private let recognizer = SFSpeechRecognizer()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?

    func requestPermissions(completion: @escaping (Bool) -> Void) {
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                completion(status == .authorized)
            }
        }
    }

    // Full streaming implementation requires AVAudioEngine. For demo we provide a stub function:
    func transcribeMock(_ text: String) {
        self.transcript = text
    }
}
