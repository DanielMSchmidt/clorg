#Clorg - The Club Organizer
[![Dependency Status](https://gemnasium.com/DanielMSchmidt/clorg.png)](https://gemnasium.com/DanielMSchmidt/clorg)
[![Code Quality](https://codeclimate.com/badge.png)](https://codeclimate.com/github/DanielMSchmidt/clorg)
##Versions:
  - 0.01: (12.04.12) Static pages, thats it
  - 0.02: (21.05.12) Basic user functions and restricted sites
  - 0.1: (27.07.12) Basic functions of messageboard (without filters, but with comments )
  - 0.101: (29.07.12) Comments are now on same Site as messages
  - 0.11: (28.08.12) Tags for messages added, with Ajax filtering
  - 0.12: (02.09.12) Eventcalendar with 2 views and rudimentary eventcreation (onClick links)
  - 0.13: (16.10.12) Exchanged own authentification with the sorcery gem and added mail activation and password recovery
  - 0.131: (13.11.12) Exchanged production DB with pg for heroku e.g.

##Features Developed:
  - simple static Pages with named routes
  - Complete user signup with sorcery including mail activation and password recovery
  - Messageboard on one site, selecting tags via ajax
  - Simple calendar with events and week/month view
  - Simple Server Setup using vagrant, nginx, unicorn and capistrano for deployment

##Features in Development:
  - Admin interface (David)
  - Tag usage with messages and events

##Todo:
  - See Milestones && Issues