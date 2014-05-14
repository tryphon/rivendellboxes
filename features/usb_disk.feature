Feature: Use USB disks

  Scenario: Access to files on an USB disk
    When the test USB disk is plugged
    Then a file "/media/test/test.mp3" should exist
