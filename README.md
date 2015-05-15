### Metamn

The source code for http://metamn.io and the associated Styleguide http://metamn.io/styleguide.

A short introduction how use Gulp to create the Styleguide can be found on Medium: https://medium.com/@metamn/creating-a-styleguide-with-gulp-2298fc928086

Here we will get all the details how everything was made.

### Technologies

* Gulp &mdash; for generating the site and the styleguide
* JSON &mdash; file database
* BEM &mdash; folder structure and naming conventions, together with a generator
* SWIG &mdash; templating language
* SCSS &mdash; style pre-processor
* JS &mdash; all animations except touch events
* Picturefill &mdash; for responsive images
* KSS &mdash; for documentation
* Flexbox for the layout
* Automatic image resize and compression
* A Styleguide in sync with the site


### Installation and usage

1. Clone the repository
2. Install all packages from `package.json` with `[sudo] npm install`
3. Generate the site: `gulp`
4. Generate the styleguide `gulp sg`
5. Resize, compress images: `gulp images`



### Folders and files

We have two sites, one for the portfolio with source files in `site`, and one for
the Styleguide with source files in `styleguide`.
The Styleguide is optional. It can be completely ignored.

The generated files can be found in `dist`. The Styleguide is mounted under `dist\styleguide`
for simplicity.

`bem.js` is generating BEM folders, blocks, elements and modifiers.

`gulpfile.js` contains all the generators and glues making the site.



#### BEM

We use BEM to create the folder structure (https://en.bem.info/method/filesystem/) and name files and classes (https://en.bem.info/method/definitions/).

In `components/framework` we use an explicit folder structure as follows:

* `behavior` &mdash; everything related to motion, animation
* `design` &mdash; everything related to design like colors, fonts, decorations
* `helpers` &mdash; SWIG helpers used across the site and the styleguide
* `structure` &mdash; everything related to structure like the grid, the responsive images, breakpoints etc.
