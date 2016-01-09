# Consultant Speak

## Purpose
This is a fun little project that demonstrates how `yo angular-fullstack` and a cloud SaaS provider like OpenShift can be used in unison to deploy an application into the cloud with a few commands.


## Live URL
**OpenShift:** [http://cspeak-danyim.rhcloud.com/](http://cspeak-danyim.rhcloud.com/)
**Personal:** [http://jargon.yimd.net/](http://jargon.yimd.net/)

[![Build Status](https://travis-ci.org/danyim/ConsultantSpeak.svg?branch=master)](https://travis-ci.org/danyim/ConsultantSpeak)

## Getting Started
- Install [MongoDB](http://docs.mongodb.org/manual/installation/)
- `npm install && bower install`
- `grunt serve`

## Deployment
- Install the OpenShift gem `gem install rhc` and run `rhc setup` with your account details
- Run `yo angular-fullstack:openshift` to create and deploy the application to your OpenShift account
- After changes, run `grunt build` then `grunt buildcontrol:openshift` to deploy

## Stack
- MEAN (MongoDB, ExpressJS, Angular, NodeJS), SASS, grunt, yeoman
- Travis CI
- Red Hat OpenShift

## Other Links
- [https://github.com/DaftMonk/generator-angular-fullstack#openshift](https://github.com/DaftMonk/generator-angular-fullstack#openshift)
