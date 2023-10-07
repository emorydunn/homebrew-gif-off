# homebrew-git-off

Small CLI for making animated GIFs from folders of images.

# Installation

To install `gif-off` run:

```shell
brew install emorydunn/gif-off/gif-off
```

# Usage

```
USAGE: gif-off <source-folder> [--output <output>] [--gif] [--png] [--mp4] [--size <size>] [--frame-duration <frame-duration>] [--loops <loops>] [-t <t> ...]

ARGUMENTS:
  <source-folder>         The source folder of images

OPTIONS:
  --output <output>       The output file
  --gif/--png/--mp4       The output file format
  --size <size>           The output file size (default: dimensions of the first frame)
  -f, --frame-duration <frame-duration>
                          Duration (in seconds) of each frame (default: 0.5)
  --loops <loops>         Number of loops (default: infinite)
  -t <t>                  Custom frame timing
  -h, --help              Show help information.
```

## Input

The source images must all reside in the same folder and be named in frame order. The files are sorted to match how they appear in Finder.

At the moment alternate orders and specifying individual frames is not supported.

### Options

#### Size

The size defaults to the dimensions of the first frame. If you'd like to resample to images specify a new size with the `--size` option.

The size is given in the format `<w>x<h>`, for example `1000x1000`.

#### Frame Duration

The frame duration defines how long, by default, each frame is shown in seconds.

#### Loops

How many times should the animation loop? For GIFs and PNGs this is optional, and the file will loop infinitely. For MP4s the looping is baked into the file, thus two loops will yield twice as many frames.

#### Custom Timing

By default all frames will be show for the duration specified with `--f`, however if you'd like some frames to play for more or less time this option can be used to give that time. The option can be used multiple times, one for each frame.

The format is `<index>:<duration>`, for example to set the duration of the second frame to 0.75 seconds: `-t 2:0.75`.

## Output

The supported output formats are:

- GIF
- PNG
- MP4 (H.264)

Use the flags `[--gif] [--png] [--mp4]` to choose the format. By default the rendered file will be named the same as the input folder with the extension appended to it.

If you'd like to choose a different output location specify it with `--output`. When using the output option the file extension is used to determine the file type, unless a format flag is specified.

# Examples

## Create a GIF from a folder of images

```shell
gif-off ~/Pictures/Session/Output --gif
```

Result: `~/Pictures/Session/Output.gif`

## Create a PNG from a folder of images, scaling to 1000x1000

```shell
gif-off ~/Pictures/Session/Output --png --size 1000x1000
```

Result: `~/Pictures/Session/Output.png`

## Create a MP4 from a folder of images, with custom frame timing

```shell
gif-off ~/Pictures/Session/Output --mp4 -t 5:0.75-t 6:1 -t 7:0.75
```

Result: `~/Pictures/Session/Output.mp4`

## Create a GIF from a folder of images, saving to the Desktop

```shell
gif-off ~/Pictures/Session/Output --output ~/Desktop/Animation.mp4
```

Result: `~/Desktop/Animation.mp4`
