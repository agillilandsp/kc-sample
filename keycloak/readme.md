# NPES Keycloak

This repo constructs a WAR file containing an embedded Keycloak 12.0.4 application. It is used in conjunction with Java 8 and JBOSS 7.3.

## Build Process

In order to build the WAR file created by this repo, run `mvn clean install`.

## Custom Theming

Keycloak allows custom themes to be created. A custom theme was created with Material UI to match the brand standards set forth by the NPES project. The source code for said theme can be found at `src/main/resources/theme`. To add extra themes, you may create a folder with the name of your new theme inside of the `src/main/resources/theme` folder, you can then copy the Keycloak base theme into your new directory. In order to add your theme to Keycloak, you first must add your theme directory to `src/main/resources/keycloak-themes.json`. It can then be selected within the Keycloak UI under Realm > Themes.

## Deployment

The WAR file created by this repo is intended to be deployed in a standard JBOSS 7.3 deployment.
