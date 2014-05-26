Feature: Desktop environment

  Scenario:
    When the user radio runs command "x-www-browser"
    Then a process "x-www-browser" should be running

  Scenario:
    When the user radio runs command "sh -c $VISUAL"
    Then a process "mousepad" should be running
