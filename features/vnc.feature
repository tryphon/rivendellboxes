Feature: VNC access

  Scenario: Enable VNC screen sharing
    Given the box configuration contains vnc_password = "secret"
    When the configuration is applied
    Then a process "x11vnc" should be running
    And a VNC access should be possible with password "secret"

  Scenario: Disable VNC screen sharing
    Given a VNC access has been configured
    And the box configuration doesn't contain vnc_password
    When the configuration is applied
    Then a process "x11vnc" should not be running
    And a VNC access should not be possible

  Scenario: Change VNC password
    Given a VNC access has been configured
    And the box configuration contains vnc_password = "new secret"
    When the configuration is applied
    Then a VNC access should be possible with password "new secret"

  Scenario: VNC screen sharing after reboot
    Given the box configuration contains vnc_password = "secret"
    And the box configuration is saved
    When the box reboots
    Then a process "x11vnc" should be running
    And a VNC access should be possible with password "secret"
