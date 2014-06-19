SCRSidewaysBarGraph
===================

A fully-customisable 'sideways bar graph' for iOS.

![SCRSidewaysBarGraph](http://f.cl.ly/items/3P420I1t2B181b3V183x/Image%202014-06-20%20at%2012.09.44%20am.png)

### Installation

[Cocoapods](http://cocoapods.org), obviously.

Append the following line to your Podfile.
```bash
pod 'SCRSidewaysBarGraph'
```

### Caveats

- Titles are not dynamic - the y-axis labels have a fixed-width of 100pt, anything over will overlap the graph. Same for the count labels, however their width varies.
- Severe lack of animations

### Contribution

Please feel free to send a pull request to fix any of the Caveats listed above. This code was written in the car on the way to [Bath University](www.bath.ac.uk/) and I didn't have the concentration to perform dynamic resizing while travelling at over 70mph.
