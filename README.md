# :chart: think-stats-ruby
## Allen B. Downey's [Think Stats 2](https://greenteapress.com/wp/think-stats-2e/) exercises in [Ruby!](http://ruby-lang.org)

## Description

This repository contains the code and data files for the book Think Stats 2. The original code accompanying the book is written in Python but I :heart: Ruby so :sunglasses:

On the other hand, this repository also provides a way for me to evaluate the state of the art in the SciRuby community and see how far one can go with stats using nothing but Ruby tools :fire:

> __DISCLAIMER__ : The structure of this repository can change substantially in the near future - but things should keep working correctly.

## Getting Started

### Installation

This project requires that you have `jupyter` installed.
In most cases, using the correct version of pip will do the trick. You may need to figure out dependency conflicts.

> Note: pip is already installed if you are using Python version >= 3.4/2.7.9
> Use pip3 if you are using Python3. Python3 is recommended.

````bash
pip3 install jupyter
````

Then make sure you have `ruby` version `2.2` or greater installed. I recommend [rvm](http://rvm.io) to install and manage ruby versions.

You also need to install [bundler](http://bundler.io) to manage ruby gems.

Once you have all that set up,

> You can just download the zip and extract it to a suitable location if you don't want to use git

````bash
git clone https://github.com/pawandubey/think-stats-ruby.git

cd think-stats-ruby

bundle # to resolve dependencies
````

## Strategy

Rewrite all helper functionality in pure Ruby and also use [`SciRuby`](http://sciruby.com/) tools wherever possible. Especially construct `Daru` dataframes and utilize that for visualizations for correctness and brevity.

Also use the [`iRuby`](https://github.com/sciruby/iruby) notebooks for exploratory data analysis with [`jupyter`](http://jupyter.org/)

But apart from all this, I also want to have fun, so don't be surprised to see me reinvent the wheels every now and again when it comes to statistical primitives.

## TODO & Status

__Current Goal__ : Finish the first 6 chapters of the book. More chapters will be covered in future runs.

- [x] Helper to read `Stata` dict files to get the schema
- [x] Helper to read `Stata` data files according to the schema
- [ ] Chapter 1
- [ ] Chapter 2
- [ ] Chapter 3
- [ ] Chapter 4
- [ ] Chapter 5
- [ ] Chapter 6

## Contributions

Bug fixes and feature additions are welcome! Just open a [Pull Request](https://github.com/pawandubey/think-stats-ruby/pulls)!

## Licence

Copyright 2017 Pawan Dubey

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
