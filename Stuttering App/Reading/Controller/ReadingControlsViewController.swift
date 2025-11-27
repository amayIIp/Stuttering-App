//
//  ReadingControlsViewController.swift
//  Spasht
//
//

import UIKit

protocol WorkoutSheetDelegate: AnyObject {
    func didTapPlayPause()
    func didTapDecreaseSpeed()
    func didTapIncreaseSpeed()
    func didTapReset()
    func didTapShowResult()
}

class ReadingControlsViewController: UIViewController {
    
    weak var delegate: WorkoutSheetDelegate?
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var decreaseSpeedButton: UIButton!
    @IBOutlet weak var increaseSpeedButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var showResult: UIButton!
    
    @IBOutlet weak var speedButton: UIButton!
        
    // The variable to update
    var currentPlaybackSpeed: Double = 1.0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        configureMenu()
    }
    
    // MARK: - Setup
    
    private func setupButtons() {
        let config = UIImage.SymbolConfiguration(pointSize: 32, weight: .light, scale: .default)
        let playSymbol = UIImage(systemName: "play", withConfiguration: config)
        playPauseButton.setImage(playSymbol, for: .normal)
        playPauseButton.tintColor = .systemBlue
    }
    
    // MARK: - Actions
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        delegate?.didTapPlayPause()
    }
    
    @IBAction func decreaseSpeedTapped(_ sender: UIButton) {
        delegate?.didTapDecreaseSpeed()
        // Optional: add haptic feedback
        let feedback = UIImpactFeedbackGenerator(style: .light)
        feedback.impactOccurred()
    }
    
    @IBAction func increaseSpeedTapped(_ sender: UIButton) {
        delegate?.didTapIncreaseSpeed()
        let feedback = UIImpactFeedbackGenerator(style: .light)
        feedback.impactOccurred()
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        delegate?.didTapReset()
        let feedback = UINotificationFeedbackGenerator()
        feedback.notificationOccurred(.success)
    }
    
    @IBAction func showResultTapped(_ sender: UIButton) {
        delegate?.didTapShowResult()
    }
    
    
    // MARK: - Public Update Method
    
    /// Called by WorkoutViewController to update button state
    func updatePlaybackState(isPlaying: Bool, hasFinished: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 32, weight: .light, scale: .default)
        let symbolName = isPlaying ? "pause" : "play"
        let symbol = UIImage(systemName: symbolName, withConfiguration: config)
        playPauseButton.setImage(symbol, for: .normal)
        
        // Optional: change tint color based on state
        playPauseButton.tintColor = isPlaying ? .systemRed : .systemBlue
    }
    
    func configureMenu() {
        
        let offAction = UIAction(
            title: "Off",
             
            state: currentPlaybackSpeed == 0 ? .on : .off
        ) { [weak self] _ in
            self?.currentPlaybackSpeed = 0
            print("Playback stopped (0x)")
            self?.configureMenu()
        }
        // Define your options
        let speedOptions = [0.05, 0.1, 0.15, 0.25, 0.5, 0.75, 1.0, 1.5]
        
        // Create actions (rows)
        let menuActions = speedOptions.map { speed in
            UIAction(title: "\(speed)s", state: speed == currentPlaybackSpeed ? .on : .off) { [weak self] action in
                // Update the variable
                self?.currentPlaybackSpeed = speed
                print("Speed updated to: \(speed)")
                
                
                // Rebuild menu to update checkmark position
                self?.configureMenu()
            }
        }
        
        let speedsMenu = UIMenu(options: .displayInline, children: menuActions)
        // Create the Menu
        // 'options: .displayInline' creates the separators seen in your image if mixed with other elements
        let menu = UIMenu(
            title: "Choose Delay for DAF",
            image: UIImage(systemName: "speedometer"), // SF Symbol
            children: [offAction, speedsMenu]
        )
        
        // Attach to Button
        speedButton.menu = menu
        speedButton.showsMenuAsPrimaryAction = true
    }

}
