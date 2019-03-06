# MusicPlayer Sample Application

[![Build Status](https://app.bitrise.io/app/997036c43511796c/status.svg?token=uhsqCBE0-srgISpb5Ncrpg)](https://app.bitrise.io/app/997036c43511796c)
<br><br>

## Architecture
- This project is based on MVVM-C trying to respect the SOLID and Clean Architecture principles.
- The ViewModel is different in this architecture because she doesn't have business logic, her responsibility is only abstract the business model data into a struct that only makes sense to the presentation layer, trying not to expose those businesses model information at viewController.
- The layers into this architecture respect a unidirectional flow (viewController -> Interactor -> Presenter -> ViewController), this helps to prevent reference cycles.
<br><br>
![](https://i.imgur.com/sGQe76A.png)

## Continuous Integration
- This repository is integrated with `Bitrise` what means that every time that a pull request is open to the `master` branch the CI will run a build and the tests for the Pull Request, also when a merge occurs with the master the CI will run the build and the tests.
- The `Bitrise` label at this readme file shows quickly if the `master` is broken or if everything is fine(tests and build).

## Unit Tests
Were implemented Unit Tests for:
- Coordinator
- Playlist Manager
- Playlist Presenter
- Playlist Interactor

## Requirements
- Xcode 10.1
- Swift 4.2

## Instructions
```bash
$ git clone https://github.com/judarlima/MusicPlayer.git
$ cd MusicPlayer/MusicPlayer
$ open GYGExample.xcworkspace
```
