# Shuffle Tracks Sample Application

[![Build Status](https://app.bitrise.io/app/8bfe6f970aa4d47e/status.svg?token=_pJbPn74xktfBFr4FL57QA)](https://app.bitrise.io/app/8bfe6f970aa4d47e)
[![codebeat badge](https://codebeat.co/badges/29fb5577-304f-4a26-bf97-c344be9f1128)](https://codebeat.co/projects/github-com-judarlima-musicplayer-master)
<br><br>

1. [ Architecture. ](#architecture)
2. [ Continuous Integration ](#ci)
3. [ Static Code Analysis ](#staticCodeAnalysis)
4. [ Unit Tests ](#unitTests)
4. [ Requirements ](#requirements)
4. [ Instructions ](#instructions)

<a name="architecture"></a>
## Architecture
- This project architecture is a variation of MVVM-C, trying to respect SOLID and Clean Architecture's principles.
- About the ViewModel, in this architecture she have a different purpose. She doesn't contains business logic, her responsibility is only abstract the business model data into a struct that only makes sense to the presentation layer, trying not to expose those businesses model information at viewController.
- The layers into this architecture respect a unidirectional flow (viewController -> Interactor -> Presenter -> ViewController), this helps to prevent reference cycles.
<br><br>
![](https://i.imgur.com/Kx6SoAF.png)

<a name="ci"></a>
## Continuous Integration
- This repository is integrated with `Bitrise` what means that every time that a pull request is open to the `master` branch the CI will run a build and the tests for the Pull Request, also when a merge occurs with the master the CI will run the build and the tests.
- The `Bitrise` label at this readme file shows quickly if the `master` is broken or if everything is fine(tests and build).

<a name="staticCodeAnalysis"></a>
## Static Code Analysis
- This repository is integrated with `Codebeat`. `Codebeat` gathers the results of code analysis into a single, real-time report that gives all project stakeholders the information required to improve code quality.

<a name="unitTests"></a>
## Unit Tests
Were implemented Unit Tests for:
- Coordinator
- Playlist DataProvider
- Playlist Presenter
- Playlist Interactor

<a name="requirements"></a>
## Requirements
- Xcode 10.1
- Swift 4.2

<a name="instructions"></a>
## Instructions
```bash
$ git clone https://github.com/judarlima/MusicPlayer.git
$ cd MusicPlayer
$ open MusicPlayer.xcodeproj/
```
