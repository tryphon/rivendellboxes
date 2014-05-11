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
