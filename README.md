# Solar 2D (formerly Corona SDK) SVG Support Patch
### An easy way to allow creating SVG display objects using the `display` library

## What does it do?
This little module will patch Solar2D's built-in `display` library to allow the creation of display objects from SVG files using the same syntax as you would for JPG or PNG files. Specifically, it modifies the `display.newImage` and `display.newImageRect` methods.

## Why?
I was working on an app that used SVG files alongside PNGs, and I was tired of having to write different code depending on the file type being used. I also have years of muscle-memory that prejudices me towards the old `display.newImage` syntax. This module made it easy to swap in SVG images for PNG (or vice-versa) without needing to change code. I figured others might find it useful, so I'm putting it here.

## Requirements
SVG support in Solar2D requires you to activate the free `nanosvg` plugin and include it in your `build.settings` file. You can acitvate the plugin here: https://marketplace.coronalabs.com/corona-plugins/nano-svg

## How to use it
Easy! Just plop `newImage_svg_patch.lua` into your project folder, and insert `require('newImage_svg_patch')` into your main.lua (preferably before creating any display objects). That's it! Now you can insert SVG images into your app just like you would any raster image file.

## Examples
Below are various examples of how you can insert an SVG file named `vector_image.svg` into your app:
```
require('newImage_svg_patch')
local vector_image = display.newImage('vector_image.svg')
```
Want to define the image's height and width using `display.newImageRect` - you can do that too:
```
require('newImage_svg_patch')
local vector_image_sized = display.newImage('vector_image.svg', 1024, 768)
```
If you like to insert images into groups by passing in the optional parent argument, you can still do that:
```
require('newImage_svg_patch')
local group = display.newGroup()
local vector_image = display.newImage(group, 'vector_image.svg')
local vector_image_sized = display.newImage(group, 'vector_image.svg', 1024, 768)
```
