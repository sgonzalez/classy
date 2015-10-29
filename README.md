# Classy - a C++ class hierarchy analyzer
Classy is an easy to use command line tool that can print out a tree for C++ class hierarchies. Output includes class names, whether the class is declared as a ```class``` or ```struct```, class inheritance publicity, and containing file names. Classy is a simple Ruby script.

## Installation
Assuming you already have Ruby installed, you just need to run ```install.sh```. The installer script just installs dependencies and creates a symbolic link to ```/usr/local/bin/classy```.

## Usage
* ```classy directory```: Prints out the class tree extracted from all ```.h``` and ```.hpp``` files within the specified directory.

* ```classy directory ClassName```: Prints out the class tree for classes under the class ```ClassName```, extracted from all ```.h``` and ```.hpp``` files within the specified directory.

## Example Output
Classy provides colorized output and cool nested formatting. The colors make Classy's output easily readable.

    Event  class  event.h
     ├── ComputerScheduleEvent  class public computerscheduleevent.h
     ├── IOEvent  class public ioevent.h
     │    ├── InputEvent  class public inputevent.h
     │    └── OutputEvent  class public outputevent.h
     └── MathModelEvent  class public mathmodelevent.h
    CompareEvent  class  event.h
    EventList  class  eventlist.h
    LoadedConfig  class  loadedconfig.h
    ProcessingUnit  class  processingunit.h
    Simulation  class  simulation.h
    KeplerianTrajectory  struct  spacecraft.h
    Attitude  struct  spacecraft.h
    Spacecraft  class  spacecraft.h
    Subsystem  class  subsystem.h
     ├── Computer  class public computer.h
     │    └── ComputerSimple  class public computersimple.h
     ├── MainEngine  class public mainengine.h
     ├── PowerSystems  class public powersystems.h
     ├── Radio  class public radio.h
     ├── RCSThrusters  class public rcsthrusters.h
     ├── ReactionWheels  class public reactionwheels.h
     └── Sensor  class public sensor.h
          └── StarTracker  class public startracker.h

## Disclaimer
Classy cannot interpret certain class declarations that have unusual syntax (namely, disgusting declarations that have the opening curly brace on a separate line). Classy is currently in development and is by no means complete. There are several things in the code that are glaringly inefficient. Bug reports and pull requests are welcome.

That being said, Classy works well for most projects and can be a welcome addition to your workflow.