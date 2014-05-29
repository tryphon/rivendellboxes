Feature: Desktop environment

  Scenario: Open a web browser
    When the user radio runs command "x-www-browser"
    Then a process "x-www-browser" should be running

  Scenario: Open a text editor via VISUAL env variable
    When the user radio runs command "sh -c $VISUAL"
    Then a process "mousepad" should be running

  Scenario: Open ftp directory in file manager
    Given the user radio opens "ftp://localhost/upload" in thunar
    When the user radio creates a new directory "test" in thunar
    Then a directory "/srv/rivendell/ftp/upload/test" should exist
    And a screenshot is saved
