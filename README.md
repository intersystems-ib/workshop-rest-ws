# workshop-rest-ws
Example about an IRIS production connected by JDBC to a MySQL database throught JGW

You can find more in-depth information in https://learning.intersystems.com.

New to IRIS Interoperability framework? Have a look at [IRIS Interoperability Intro Workshop](https://github.com/intersystems-ib/workshop-interop-intro).

# What do you need to install? 
* [Git](https://git-scm.com/downloads) 
* [Docker](https://www.docker.com/products/docker-desktop) (if you are using Windows, make sure you set your Docker installation to use "Linux containers").
* [Docker Compose](https://docs.docker.com/compose/install/)
* [Visual Studio Code](https://code.visualstudio.com/download) + [InterSystems ObjectScript VSCode Extension](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript)
* [Postman](https://www.postman.com/downloads/)

# Setup
Build the image that we are going to use during the workshop:

```console
$ git clone https://github.com/intersystems-ib/workshop-rest-ws
$ cd workshop-rest-ws
$ docker-compose build
```

# Example

The main purpose of this example is to create a REST service to save and get an object "Person" using REST call from Postman.

## Test Production 
* Run the containers we will use in the workshop:
```
docker-compose up -d
```
Automatically an IRIS instance will be deployed and a production will be configured and started to save and retrieve Person objects.

* Open the [Management Portal](http://localhost:52774/csp/sys/UtilHome.csp).
* Login using the default `superuser`/ `SYS` account.
* Click on [Test Production](http://localhost:52774/csp/wstest/EnsPortal.ProductionConfig.zen?$NAMESPACE=WSTEST&$NAMESPACE=WSTEST&) to access the sample production that we are going to use. You can access also through *Interoperability > User > Configure > Production*.
  * You will notice that there are two Business Service configured (one to save a Person object and the other to get a Person by the PersonId property).
  * There are two Business Operations too, one to retrieve the Person specified by the id provided from Postman and the other one to save the Person object with the JSON object sent from Postman too.
* Now open Web Applications option from *System Administration > Security > Applications > Web Applications*..
  * You will see all the default web applicationa and a new one, */csp/rest/wstest*. This new web application is configured as REST with the Dispatch class *WSTEST.Endpoint*.
* Open your Postman and import *WSTest.postman_collection* file. With this configuration you will be able to test both functionalities without any problem.
