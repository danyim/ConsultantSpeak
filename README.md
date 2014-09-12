## Purpose ##
This is a fun little project that demonstrates how `yo angular-fullstack` (with MongoDB, SASS, Bootstrap) and OpenShift can be used to deploy an application in the cloud with a few commands.

## Live URL ##
  **OpenShift:** [http://cspeak-danyim.rhcloud.com/](http://cspeak-danyim.rhcloud.com/)

## Getting Started ##
- Install MongoDB
- `npm install && bower install`
- `grunt serve`

## Deployment ##
- Install the OpenShift gem `gem install rhc` and run `rhc setup` with your account details
- Run `yo angular-fullstack:openshift` to create and deploy the application to your OpenShift account
- After changes, run `grunt build` then `grunt buildcontrol:openshift` to deploy

## Other Links ##
- [https://github.com/DaftMonk/generator-angular-fullstack#openshift](https://github.com/DaftMonk/generator-angular-fullstack#openshift)
