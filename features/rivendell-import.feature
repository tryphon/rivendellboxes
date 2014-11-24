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
    When a sound file is dropped into "music/artist/album/file.mp3" with attributes:
         | title | Test title |
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

  # Use file name as title because metadata aren't recognized (see #1256)
  Scenario: Import Ogg/Vorbis file
    Given the rivendell import is configured with
     """
     Rivendell::Import.config do |config|
       config.to_prepare do |file|
         file.in('music') do
          cart.default_title = file.basename
          cart.group = 'MUSIC'
         end
       end
     end
     """
    When a sound file is dropped into "music/artist/album/from_ogg_file.ogg" with attributes:
         | title | Test title |
    And all rivendell import tasks are completed
    Then a cart should exist in group "MUSIC" with attributes:
         | average_length |     0:02:59.7 |
         | title          | from_ogg_file |

  @wip
  Scenario: Import a very long file
    Given the rivendell import is configured with
     """
     Rivendell::API.logger = Rivendell::Import.logger

     Rivendell::Import.config do |config|
       config.to_prepare do |file|
         cart.default_title = file.basename
         cart.group = 'TEMP'
         cart.import_options[:timeout] = 20

         task.delete_file!
       end
     end
     """
    When a sound file is dropped into "very_long.mp3" with attributes:
         | length | 3:00:00 |
    And all rivendell import tasks are completed without timeout
    Then a cart should exist in group "TEMP" with attributes:
         | average_length |   3:00:00 |
         | title          | very_long |

  Scenario: Restart the rivendell import process
    When the service "rivendell-import" is restarted
    Then the rivendell import web interface should be available

  Scenario: Support mysql reconnection
    When the service "mysql" is restarted
    Then the rivendell import web interface should be available
