## Metamn

The source code for http://metamn.io and the associated Styleguide http://metamn.io/styleguide

## Technologies

* Gulp &mdash; for generating the site and the styleguide
* JSON &mdash; file database
* BEM &mdash; folder structure and naming conventions, together with a generator
* SWIG &mdash; templating language
* SCSS &mdash; style pre-processor
* JS &mdash; all animations except touch events
* Picturefill &mdash; for responsive images
* KSS &mdash; for documentation
* Automatic image resize and compression
* A Styleguide in sync with the site

## Folders and files

We have two sites, one for the portfolio with source files in `site`, and one for
the Styleguide with source files in `styleguide`.
The Styleguide is optional. It can be completely ignored.

The generated files can be found in `dist`. The Styleguide is mounted under `dist\styleguide`
for simplicity.

`bem.js` is generating BEM folders, blocks, elements and modifiers.

`gulpfile.js` contains all the generators and glues making the site.
