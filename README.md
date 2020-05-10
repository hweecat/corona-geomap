# Geomap of COVID-19 cases and deaths globally

Geo-visualization of COVID-19 confirmed cases and deaths using Plotly, with automated updates using GitHub Actions.

Netlify-ed version on https://geomap.ongchinhwee.me

Author: Ong Chin Hwee (@hweecat)

## Key Dependencies
Works on Python 3.6, 3.7

Pandas 0.25.x (breaks on Pandas 1.0.x, not backward-compatible with Pandas 0.24.x and below due to tz-aware timestamps)

## Why did I create this?
I joined the CoronaTracker analytics team in end January 2020 as a way to contribute towards the fight against the coronavirus (which was then still known as 2019-nCoV) with my data skills while developing my technical skills. The data is scraped daily from JHU CSSE by the CoronaTracker tech team and stored in a MySQL database hosted on the CoronaTracker cloud-hosted server.

I created this geo-visualization of COVID-19 cases with the objective of reflecting the magnitude of the number of cases and deaths on a by-country basis over a time-scale. Within a few days (that included getting up to speed with accessing the CoronaTracker MySQL database using SQLAlchemy and using GeoPandas to handle map coordinates), my first prototype of the Plotly-generated geomap HTML was up by 1 February 2020. A timeline slider was added subsequently to show an animated timeline of the epidemic (now pandemic).

## Automating Geo-visualization Updates
Initially, I wrote a Shell script to package the commands that I had been executing repeatedly to update the geomap whenever I could without re-typing the commands over and over again. As work and life started getting in the way, there were days which I forgot to run the Shell script to update the geomap - hence the idea of automating the script execution using some form of cron scheduler. Running a cronjob to automate the script execution using Ubuntu WSL1 did not go well, and my attempts at using Google Cloud Functions to trigger updates by pushing a new HTML to overwrite the previous HTML was a costly experiment (in terms of credits).

As of April 2020, I have successfully added GitHub Actions to the automation workflow. The Action uses a cron scheduler to run the Shell script in a Docker container on GitHub every 2 hours, to account for delays in database updates and issues with CI/CD on GitHub Actions. The update frequency is arbitrary and subject to possible changes.
