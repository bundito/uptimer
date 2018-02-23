A simple, no-configuration plasmoid to show your system uptime. It's intended for a top or bottom panel. It doesn't do anything but show your uptime, which is why there's no configuration options. Click on it all you want, it still won't do anything except update minute by minute.

To install, copy the entire "org.kde.uptimer" directory to your personal plasmoid directory:

     $HOME/.local/share/plasma/plasmoids

and then issue the command

    kpackagetool5 --install org.kde.uptimer

And the plasmoid will appear in your pane of available widgets. Again, the text is laid out only for horizontal panels. It's not fancy enough to be shown sideways. Although I should work on that.


