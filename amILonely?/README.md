# am I lonely?
I have created this script for shutting down my server (connected to an UPS) when the electricity goes out.

## usage

1. insert some of your non-ups-protected devices' IPs in the ```hosts``` array so that when the electricity goes out, they will not pong (ping response) back to your ping.
2. link the script on a cronjob with ```*/2 * * * *``` so every 2 minutes it will be executed.