# pux-starter-app-material-ui

This small example project demonstrates how to use [material-ui](http://www.material-ui.com) 
from [purescript-pux](http://purescript-pux.org/) .

This project is based on [starter app](http://github.com/alexmingoia/pux-starter-app), which is a skeleton
Pux project configured with webpack and supporting hot-reload for rapid
development.


## Installation

Clone the repository and run `npm install` to get started:

```sh
git clone git://github.com/shybyte/pux-starter-app-material-ui
cd pux-starter-app-material-ui
npm install
npm start
```

After compiling the app should be available at `http://localhost:8080`.

### Directory structure

- `src`: Application source code.
  - `src/App/Config.js`: Configuration values.
  - `src/App/Config.purs`: Configuration type.
  - `src/App/MaterialUi.js`: Javascript files for the material ui bindings.
  - `src/App/MaterialUi.purs`: Purescript files for the material ui bindings.
  - `src/Main.purs`: PureScript entry point.
- `static`: Static files served with application.
- `support`: Support files for building.
  - `support/entry.js`: Webpack entry point. Handles hot reloading.
- `bower.json`: Bower package configuration.
- `package.json`: Node package configuration.
- `webpack.config.js`: Webpack configuration.

### NPM scripts

#### watch

`npm start` or `npm run watch` will start a development server, which
hot-reloads your application when sources changes.

#### serve

`NODE_ENV=production npm run serve` builds your application and starts a
production server.

#### build

`npm run build` builds application client and server bundles.
