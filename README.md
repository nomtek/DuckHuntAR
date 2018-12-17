# DuckHuntAR

![Platform: iOS](https://img.shields.io/badge/Platform-iOS-03A9F4.svg?style=flat)
![Gameplay Example](ReadmeAssets/review.gif)

*DuckHuntAR* is an iOS app written in Swift that uses an ARKit to bring classic old-school game experience to the new world. We took a beloved game called Duck Hunt, originally available on NES console, next decomposed it into prime factors and bring it back as an augmented reality tech demo. The main goal of the project is to show and describe our attempts to design handy architecture for AR projects.

A more detailed description of the whole can be found in our blog posts: [part 1](https://medium.com/inborn-experience/combine-duckhunt-with-arkit-lesson-1-welcome-to-the-world-of-components-ada2c964c9da) and part 2 (t.b.p.)

## Assets

In *nomtek* we love old school games and we respect the Nintendo contribution to that aspect. Because of that love, we decided not to push assets from original Duck Hunt to our repository. So if you want to run the game by yourself, you will need to put a little bit of work. But don't worry, we will help you with that ;)

All the assets should be placed into `Resources/hunt.scnassets` and then respectively with the folder's name.

### Graphics

Let's start with the images. Every sprite needs to be a separate file. Sounds complicated? Don't worry, to be honest, it's not ;)
Here's an example of what this should look like for the *Dog* character:
[Dog Example](ReadmeAssets/dog_assets_example.png)

Now doesn't look that complicated, isn't it? Yeah, still a little bit o work, but not that complicated. So how it should like in the case of ducks and the environment?
Just take a look at those examples:
[Duck Example](ReadmeAssets/duck_assets_example.png)
[Environment Example](ReadmeAssets/textures_assets_example.png)

Still looking easy, right? Ok, so why only one example for ducks? In cases of blue and red ducks you need to prepare sprites in exactly the same way but just change the names respectively to `blue_duck_falling` or `red_duck_falling`.

### Sounds

All sounds should be placed in the `Resources/hunt.scnassets/sounds` folder.
Here is a list of all sounds used in the project with short information when you should hear them:
* `game_start.mp3` - music played when gameplay starts, exactly at the moment when the dog goes to the grass
* `dog_bark.wav` - the sound of barking dog, played by *Dog* character just before jumping into the bushes
* `dog_happy.wav` - sound played when you successfully hunt the *Duck* when the *Dog* shows off with her
* `dog_laugh.wav` - sound played when you fail to hunt the *Duck* when the *Dog* shows off and laughs at you
* `duck_falling_mono.wav` - sound played when you successfully hunt the *Duck* and she is falling down
* `duck_flying_quack_mono.wav` - sound played when the *Duck* is in the air. It's a combination of quack and flapping of the wings
* `duck_quack_mono.wav` - single quack sound
* `gun_fire.wav` - sound played when players fire the gun 

## Author

DuckHuntAR was written by *nomtek*. It uses modified version of [SKLinearAlgebra](https://github.com/apexskier/SKLinearAlgebra) and [Apple's ARKit](https://developer.apple.com/arkit/).

## License
Copyright (c) 2018 *nomtek*. See the LICENSE file for details.
