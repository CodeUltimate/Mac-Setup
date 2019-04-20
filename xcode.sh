#!/bin/sh

# Install XCode Command Line Tools with AppleScript
# Note: License Agreement Acceptance is currently hard coded as tabs
echo "Downloading XCode Command Line Tools..."; echo

xcode-select --install
sleep 1
osascript <<EOD
  tell application "System Events"
    tell process "Install Command Line Developer Tools"
      keystroke return
      delay 3
      keystroke tab
      keystroke tab
      keystroke return
    end tell
  end tell
EOD


# Wait for download to finish
PROCESS_PID=`/bin/ps -fu $USER| grep "Install Command Line Developer Tools" | grep -v "grep" | awk '{print $2}'`
while kill -0 $PROCESS_PID >/dev/null 2>&1
  do
    echo "Downloading..."
    sleep 10
done


echo "XCode Command Line Tools Download Complete"; echo