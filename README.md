# 🎙️ Pitch Perfect

An iOS app that lets you record your voice and play it back with fun sound effects — Snail, Rabbit, Chipmunk, Darth Vader, Echo, and Reverb. Built as Project 1 of the Udacity iOS Developer Nanodegree.

## 📱 Overview

Pitch Perfect is a two-scene app built with UIKit and Storyboards:

1. **Record Sounds** — Tap the microphone to start recording. A "Recording..." label and enabled Stop button let you know it's in progress.
2. **Play Sounds** — Once recording finishes, the app automatically transitions to a screen where you can play back your voice through six different audio effects.

## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/645149ef-00ed-44c0-b1aa-a72aecfafad7" alt="Record Sounds screen" width="280">
  <img src="https://github.com/user-attachments/assets/964c1519-819d-4e73-9571-493ca84659f0" alt="Play Sounds screen" width="280">
</p>

| Record Sounds | Play Sounds |
|:---:|:---:|
| Tap the mic to start recording, tap stop to finish | Choose an effect to play back your recording |

> Add your own screenshots to a `screenshots/` folder in the repo root, named `record-screen.png` and `play-screen.png` (or update the paths above to match your files).

## ✨ Features

- 🎤 Record audio using `AVAudioRecorder`
- ▶️ Playback with pitch/rate/effect manipulation via `AVAudioPlayer` and `AVAudioEngine`
- 🐌 **Snail** — slowed-down playback
- 🐇 **Rabbit** — sped-up playback
- 🐿️ **Chipmunk** — high-pitched playback
- 🎧 **Darth Vader** — low-pitched playback
- 📢 **Echo** effect
- 🌊 **Reverb** effect
- 🔄 Navigate back to re-record a new clip at any time
- 📐 Adaptive layout for iPhone and iPad, portrait and landscape

## 🏗️ Architecture

- **UINavigationController** manages navigation between the Record and Play scenes
- **Delegate pattern**: `AVAudioRecorderDelegate`'s `audioRecorderDidFinishRecording()` detects when recording ends
- **Programmatic segue**: transitions from Record → Play are triggered via `performSegueWithIdentifier()` rather than a hardcoded Storyboard segue
- **IBActions/IBOutlets**: UI elements are wired directly to action methods for recording and playback control
- Reusable, well-commented Swift code following standard naming and style conventions

## 🛠️ Built With

- Swift
- UIKit
- AVFoundation (`AVAudioRecorder`, `AVAudioPlayer`, `AVAudioEngine`)
- Storyboards & Auto Layout / UIStackView

## 🚀 Getting Started

### Prerequisites

- Xcode (latest stable release recommended)
- iOS Simulator or a physical device running a compatible iOS version

### Installation

```bash
git clone https://github.com/<your-username>/pitch-perfect.git
cd pitch-perfect
open PitchPerfect.xcodeproj
```

Build and run (`Cmd + R`) on your simulator or device.

> **Note:** Recording requires microphone access — the app will prompt for permission on first launch. Test on a physical device for the most accurate audio experience.

## 📂 Project Structure

```
PitchPerfect/
├── RecordSoundsViewController.swift   # Handles audio recording
├── PlaySoundsViewController.swift     # Handles playback + effects
├── Sound.swift                        # Model passed between scenes
├── Main.storyboard                    # UI layout for both scenes
└── Info.plist
```

## 📌 Possible Improvements

- Add `UIStackView`-based layout to the Record scene (already used in Play scene)
- Display recording duration using `AVAudioPlayer`'s duration property
- Add a waveform visualization during recording

## 📄 License

This project was built for educational purposes as part of the Udacity iOS Developer Nanodegree.
