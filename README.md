# gif-off

Small CLI for making animated GIFs from folders of images.

# Installation

To install `gif-off` run:

```shell
brew install emorydunn/gif-off/gif-off
```

# Why?

There are lots of ways to string a series of pictures together to create a very fast slideshow, a "moving picture", if you will. You can use `ffmpeg`, if you can remember its arcane incantations. Or maybe use a non-linear editor, but that's an awful lot of overhead for a dozen frames. Some sort of Automator action or AppleScript?

For me none of the options really fit, so I wanted to build something that was quick and too the point: images in, animation out. There are options where you want them, but none where you don't need them.

## The Name?

The utility is called `gif-off` but really it's "G!F Off", named for an impolite phrase with a similar ending one might utter after being asked to make another animated GIF on set that wasn't on the shotlist that no one's going to use anyway but the AD just thought it would be Fun.

# Usage

```
OVERVIEW: Render images in a folder

USAGE: gif-off directory [<options>] <source-folder>

ARGUMENTS:
  <source-folder>         The source folder of images

OPTIONS:
  -o, --output <output>   The output file
  --name <name>           The output filename
  -a <a>                  The output file format (values: gif, png, mp4, mov)
  -w, --width <width>     Width of the animation
  -h, --height <height>   Height of the animation
  --size <size>           Fixed size
  -f, --frame-duration <frame-duration>
                          Duration (in seconds) of each frame (default: 0.5)
  --loops <loops>         Number of loops (default: infinite)
  -t <t>                  Custom frame timing
  --dry-run               Print a summary of the operation without rendering anything
  --save-timing/--no-save-timing
                          Save custom timings into a sidecar file (default: --save-timing)
  --read-timing/--no-read-timing
                          Read custom timings from a sidecar file (default: --read-timing)
  --help                  Show help information.
```

## Input

The source images must all reside in the same folder and be named in frame order. The files are sorted to match how they appear in Finder.

At the moment alternate orders and specifying individual frames is not supported.

### Options

#### Size

The size defaults to the dimensions of the first frame. You can also specify a fixed size or to scale the images to either a given width or height.

To render to a fixed width or height use `--width` or `--height` (or both for a fixed size). A fixed size can also be given in a single option with `--size` in the format `<w>x<h>`, for example `1000x1000`.

When giving a single dimension the dimensions of the file are based on the first frame. All other frames will be scaled into those dimensions. At this time cropping is not supported.

#### Frame Duration

The frame duration defines how long, by default, each frame is shown in seconds.

#### Loops

How many times should the animation loop? For GIFs and PNGs this is optional, and the file will loop infinitely. For MP4s the looping is baked into the file, thus two loops will yield twice as many frames.

#### Custom Timing

By default all frames will be show for the duration specified with `--f`, however if you'd like some frames to play for more or less time this option can be used to give that time. The option can be used multiple times, one for each frame.

The format is `<index>:<duration>`, for example to set the duration of the second frame to 0.75 seconds: `-t 2:0.75`. The index is one-based, to set the timing for the first frame use `1:0.5`, second frame `2:1.5`, etc.

By default any custom frame timing is also read from and written to a sidecar file, `.timing`, in the source folder. The format is the same, with each frame on a new line. Any timings passed in on the command line override those in the sidecar and will be saved. Use the `--no` prefix on `read-timing` and `save-timing` to neither read nor write.

## Output

The supported output formats are:

- GIF
- PNG
- MP4 (H.264)
- MOV (H.264)

`gif-off` supports rendering multiple file types at once, specified with `-a`, which can be grouped like so `-a mp4 gif`.

By default the rendered output is saved _next to_ the source folder with the same name, so `input folder` becomes `input folder.gif`. The output filename can be changed with `--name`.

To save the output files to a different directory use `--output`, and all files will be saved into that folder.

Additionally the type can be determined automatically if the output is a file, `-o ~/Desktop/output.mov`. Either formats or an extension can be used, not both.

# Examples

## Create a GIF from a folder of images

```shell
gif-off ~/Pictures/Session/Output -a gif
```

Result: `~/Pictures/Session/Output.gif`

## Create a GIF & MP4 from a folder of images

```shell
gif-off ~/Pictures/Session/Output -a gif mp4
```

Result: `~/Pictures/Session/Output.gif`, `~/Pictures/Session/Output.mp4`

## Create a PNG from a folder of images, scaling to 1000x1000

```shell
gif-off ~/Pictures/Session/Output -a png --size 1000x1000
```

Result: `~/Pictures/Session/Output.png`

## Create a MP4 from a folder of images, scaling to a height of 1080, named HD

```shell
gif-off ~/Pictures/Session/Output --name HD -a mp4 --height 1080
```

Result: `~/Pictures/Session/HD.mp4`

## Create a PNG from a folder of images, scaling to a height of 1080, named HD, saved to the Desktop

```shell
gif-off ~/Pictures/Session/Output --name HD -a mp4 --height 1080 -o ~/Desktop
```

Result: `~/Desktop/HD.mp4`

## Create a MP4 from a folder of images, with custom frame timing

```shell
gif-off ~/Pictures/Session/Output -a mp4 -t 5:0.75 -t 6:1 -t 7:0.75
```

Result: `~/Pictures/Session/Output.mp4`

## Create a GIF from a folder of images, saving to the Desktop

```shell
gif-off ~/Pictures/Session/Output --output ~/Desktop/Animation.gif
```

Result: `~/Desktop/Animation.gif`

# Batch Usage

Batch mode is a subcommand that will read files from the standard input rather than from a folder.

```
OVERVIEW: Collect files from the standard input to render

Enter files to render one line at a time. The line --render will begin rendering the images.

USAGE: gif-off batch [--output <output>] [--name <name>] [-a <a> ...] [--width <width>] [--height <height>] [--size <size>] [--frame-duration <frame-duration>] [--loops <loops>]

OPTIONS:
  -o, --output <output>   The output file
  --name <name>           The output filename
  -a <a>                  The output file format (values: gif, png, mp4, mov)
  -w, --width <width>     Width of the animation
  -h, --height <height>   Height of the animation
  --size <size>           Fixed size
  -f, --frame-duration <frame-duration>
                          Duration (in seconds) of each frame (default: 0.5)
  --loops <loops>         Number of loops (default: infinite)
  -h, --help              Show help information.
```

When using batch mode, the program will wait in a loop for file path to be given on the standard input, separated by a newline. To begin the render pass `--render` on its own line.
