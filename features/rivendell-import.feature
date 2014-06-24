Feature: Rivendell Import

  Scenario: Import music file
    Given the rivendell import is configured with
     """
     Rivendell::Import.config do |config|
       config.to_prepare do |file|
         file.in('music') do
          cart.group = 'MUSIC'
         end
       end
     end
     """
    When a sound file is dropped into "music/artist/album/file.mp3" with title "Test title"
    And all rivendell import tasks are completed
    Then a cart "Test title" should exist in group "MUSIC"

  Scenario: Import a file without title
    Given the rivendell import is configured with
     """
     Rivendell::Import.config do |config|
       config.to_prepare do |file|
         cart.default_title = file.basename
         cart.group = 'TEMP'
       end
     end
     """
    When a sound file is dropped into "test.wav"
    And all rivendell import tasks are completed
    Then a cart "test" should exist in group "TEMP"

  Scenario: Restart the rivendell import process
    When the service "rivendell-import" is restarted
    Then the rivendell import web interface should be available

  Scenario: Support mysql reconnection
    When the service "mysql" is restarted
    Then the rivendell import web interface should be available
