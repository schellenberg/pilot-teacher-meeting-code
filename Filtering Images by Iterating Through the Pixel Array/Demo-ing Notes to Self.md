#Things to Demo for Image Processing

1. Show the pixel_array_figure and pixel_array_figure2 images to show how an image is stored as a 1D array

2. Painting with Pixels
	- loadPixels()
	- pixels[y*width + x] = color(0)
	- updatePixels()
	- set x and y to mouse, but don't forget to constrain x and y to 1 less than width & height

3. Pixel Location 2D
	- nested loop (x < width, y < height)
	- set pixels to either black or white based on even or odd to make a striped image

4. Passwords Color 
	- loadImage("theImage.jpg")
	- extract color using pixels[y*width + x]
	- fill a rect with the current mouse location color, and display it in middle of screen

5. First Image Filter
	- show theImage.loadPixels();
	- iterate through an array of length theImage.width * theImage * height
	- extract color information for each pixel using redAmount = red(theImage.pixels[i]
	- apply simple image filter (255 - redAmount to do an inversion thingee)
	- constrain colors between 0 and 255
	- theImage.updatePixels()

6. Spotlight Filter
	- theImage.resize(width,0)
	- messedDavey = createImage(theImage.width, theImage.height, RGB)
	- nested loop this time, extract color information into r,g,b variables
	- dist(x,y, mouseX, mouseY) 
	- if dist < 100, use old values
	- else, set it black
	- messedDavey.pixels[pixLoc] = color(newR, newG, newB)

7. Threshold Filter
	- use spotlight filter as template
	- float howBright = brightness(davey.pixels[pixLoc]);
	- float theThreshold = map(mouseX, 0, width, 0, 255);
	- if (howBright > theThreshold) {
		
8. Make your own filters!