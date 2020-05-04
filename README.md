# web-scraper
A Website Scraping Tool developed in Ruby


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
[![Run on Repl.it](https://repl.it/badge/github/adamclasic/tictactoe)](https://repl.it/@PhillipUg/tictactoe )

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/adamclasic/tictactoe">
    <img src="images/microverse.png" alt="Logo" width="80" height="80">
  </a>

  <h1 align="center">Tic Tac Toe</h1>

  <p align="center">
    This project is part of the Microverse curriculum in Ruby module!
    <br />
    <a href="https://github.com/adamclasic/tictactoe"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://repl.it/@PhillipUg/tictactoe ">View Demo</a>
    ·
    <a href="https://github.com/adamclasic/tictactoe/issues">Report Bug</a>
    ·
    <a href="https://github.com/adamclasic/tictactoe/issues">Request Feature</a>
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

[![Product Name Screen Shot][product-screenshot]](https://repl.it/@PhillipUg/tictactoe )

This is the third project of the Microverse Ruby Module

This is also the first project of the [Odin project curriculum](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)

<!-- ABOUT THE PROJECT -->
## Installation

To play this game you need to:
* have ruby installed in your computer
* [download](https://github.com/adamclasic/tictactoe/archive/master.zip) or clone this repo:
  - Clone with SSH:
  ```
    git@github.com:adamclasic/tictactoe.git
  ```
  - Clone with HTTPS
  ```
    https://github.com/adamclasic/tictactoe.git
  ```
* and execute bin/main.rb file using your terminal

## Game Rules

  * This is a customized version of the original [tic-tac-toe](https://en.wikipedia.org/wiki/Tic-tac-toe) game. The basic rules remain unchanged, the tokens to play with have changed instead.

  * The game is played on a 3 by 3 grid
  ```
      X  |   X   |   X    
    ----------------------
      X  |   O   |   O    
    ----------------------
      X  |   X   |   X      
  ```

  * In this game, there are only two letters to play with 'X' and 'O'. Whichever player gets the first similar letters in an entire row, column or diagonal WINS!!!.
  * At the begining of the game, player 1 will choose either 'X' or 'O' and the other letter will be assigned to player 2 automatically.
  * Once the players both have letters to play with, they will use numbers 1 through 9 to select a position on the game board. for example:
    ```
      Player playing with 'X' enters position '2'.

          1   2   3  
        -------------
      1 |   | X |   | 3
        -------------
      4 |   |   |   | 6
        -------------
      7 |   |   |   | 9
        -------------
          7   8   9    

      Player playing with 'O' enter position '5'.

          1   2   3  
        -------------
      1 |   |   |   | 3
        -------------
      4 |   | O |   | 6
        -------------
      7 |   |   |   | 9
        -------------
          7   8   9   
    ```
    * The first player to get their letters in a row (up, down, across, or diagonally) wins e.g.
    ```
  

          X | O | O    X | X | X     X | O | O     O | O | O
         -----------  -----------   -----------  -----------
          X | X | O    O | O | O     X | X | O     O | X | O
         -----------  -----------   -----------  -----------
          X | X | X    X | X | X     O | O | O     O | X | O
    ```
    * When all squares are full and no player has won, then game ends in as a Draw e.g.

      ```
           O   |  X   |  O     
        ----------------------
           O   |  X   |  X    
        ----------------------
           X   |  O   |  O     
      ```




### Built With
This project was built using these technologies.
* Ruby
* Rspec

### Testing
If you wish to test it. Install `Rspec`with `gem install rspec`. We used `rspec 3.9.1` but any version not older than `3.0`should work fine. Clone this repo to your local machine, cd into tictactoe directory and run `rspec`

<!-- LIVE VERSION -->
## Live version

You can see it working [here](https://repl.it/@PhillipUg/tictactoe )

<!-- CONTACT -->
## Contributors


👤 **Phillip Musiime**

- LinkedIn: [Phillip Musiime](https://www.linkedin.com/in/phillip-musiime-74657019a/)
- GitHub: [PhillipUg](https://github.com/PhillipUg)
- Twitter: [@Phillip_Ug](https://twitter.com/Phillip_Ug)
- E-mail: phillipmusiime@gmail.com

👤 **Abderrahmane Adam Allalou**

- LinkedIn: [Abderrahmane Adam Allalou](https://www.linkedin.com/in/abderrahmane-allalou/)
- GitHub: [@adamclasic](https://github.com/adamclasic)
- E-mail: aabou9@gmail.com


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)
* [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
* [tic-tac-toe](https://en.wikipedia.org/wiki/Tic-tac-toe)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/adamclasic/tictactoe.svg?style=flat-square
[contributors-url]: https://github.com/adamclasic/tictactoe/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/adamclasic/tictactoe.svg?style=flat-square
[forks-url]: https://github.com/adamclasic/tictactoe/network/members
[stars-shield]: https://img.shields.io/github/stars/adamclasic/tictactoe.svg?style=flat-square
[stars-url]: https://github.com/adamclasic/tictactoe/stargazers
[issues-shield]: https://img.shields.io/github/issues/adamclasic/tictactoe.svg?style=flat-square
[issues-url]: https://github.com/adamclasic/tictactoe/issues
[product-screenshot]: images/tic-tac-toe.png

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

