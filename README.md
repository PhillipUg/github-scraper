# Github Scraper
A Github Scraping Tool developed with Ruby and the Nokogiri gem


<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Run on Repl.it][replit-sheild]][replit-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/PhillipUg/github-scraper">
    <img src="images/github-scraper.png" alt="Logo" width="80" height="80">
  </a>

  <h1 align="center">Github Scraper</h1>

  <p align="center">
    This project is part of the Microverse curriculum in Ruby module!
    <br />
    <a href="https://github.com/PhillipUg/github-scraper"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://repl.it/@PhillipUg/github-scraper ">View Demo</a>
    ·
    <a href="https://github.com/PhillipUg/github-scraper/issues">Report Bug</a>
    ·
    <a href="https://github.com/PhillipUg/github-scraper/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
  * [Testing](#testing)
* [Live Version](#live-version)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)
* [License](#license)

<!-- ABOUT THE PROJECT -->
## About The Project

This is Github Scrapping Tool built with ruby. This Tools is built as a capstone project for completing one of Microverse's Main Technical Curriculum sections.

[![Product Name Screen Shot][product-screenshot]][screenshot-url]

<!-- ABOUT THE PROJECT -->
## Installation

To use this scraper this is what you need to:
* Have ruby installed in your computer
* [Download](https://github.com/PhillipUg/github-scraper/archive/master.zip) or clone this repo:
  - Clone with SSH:
  ```
    git@github.com:PhillipUg/github-scraper.git
  ```
  - Clone with HTTPS
  ```
    https://github.com/PhillipUg/github-scraper.git
  ```
* `cd` into `github-scraper` directory and run `bundle install`
* Finally, run `bin/main.rb` in your terminal.

## How to use
When you first run this github scraping tool it begins by showing you the summary info output format

```
   Github User
  -------------------------------  
  Name: xxxxxx (xxxxxx)  
  Bio: xxxxxx  
  Work: xxxxxx  
  Location: xxxxxx  
  Website: xxxxxx  
  ---------------------------------
  pinned Repositories
  ---------------------------------
  1. xxxxxx
  2. xxxxxx
  3. xxxxxx
  4. xxxxxx
  5. xxxxxx
  6. xxxxxx
  --------------------------------
```

After this, you are prompted to enter a valid github username. Then it returns the above output format with all the information filled in.

```
  Categories
  ---------------------------------
  repositories: xxxxxx
  stars: xxxxxx
  followers: xxxxxx
  following: xxxxxx
  ----------------------------------
```
Then you will be prompted to enter a category name to see a full list of its contents. For instance enter `repositories` or `stars` to get a list of those scrapped categories. This will continue until you exit the program by typing `'q'` in the terminal and pressing Enter.

### Built With
This project was built using these technologies.
* Ruby
* Rspec
* Nokogiri gem
* Colorize gem

### Testing
If you wish to test it. Install `Rspec`with `gem install rspec`. We used `rspec 3.9.1` but any version not older than `3.0`should work fine. Clone this repo to your local machine, cd into github-scraper directory and run `rspec`

<!-- LIVE VERSION -->
## Live version

You can try it live on [repl.it](https://repl.it/@PhillipUg/github-scraper)

## Video Demo
Check out [this video](https://www.loom.com/share/9ba92a37201e43d981c3675af86dc5ad) demonstration of how I built the scraper.

<!-- CONTACT -->
## Contact

👤 **Phillip Musiime**

- LinkedIn: [Phillip Musiime](https://www.linkedin.com/in/phillip-musiime)
- GitHub: [PhillipUg](https://github.com/PhillipUg)
- Twitter: [@Phillip_Ug](https://twitter.com/Phillip_Ug)
- E-mail: phillipmusiime@gmail.com

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/PhillipUg/github-scraper.svg?style=flat-square
[contributors-url]: https://github.com/PhillipUg/github-scraper/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/PhillipUg/github-scraper.svg?style=flat-square
[forks-url]: https://github.com/PhillipUg/github-scraper/network/members
[stars-shield]: https://img.shields.io/github/stars/PhillipUg/github-scraper.svg?style=flat-square
[stars-url]: https://github.com/PhillipUg/github-scraper/stargazers
[issues-shield]: https://img.shields.io/github/issues/PhillipUg/github-scraper.svg?style=flat-square
[issues-url]: https://github.com/PhillipUg/github-scraper/issues
[replit-sheild]: https://repl.it/badge/github/PhillipUg/github-scraper
[replit-url]: https://repl.it/@PhillipUg/github-scraper
[product-screenshot]: images/scraper.gif
[screenshot-url]: https://repl.it/@PhillipUg/github-scraper

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

