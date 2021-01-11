<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8" />
    <title>Angular on Java</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.png" />
    <base href="/" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="/webapp/aoj/styles.css" />
    <link rel="stylesheet" href="/external/npm/node_modules/@angular/material/prebuilt-themes/deeppurple-amber.css" />
  </head>

  <body>
    <app-component></app-component>
    <script nomodule="" src="/external/npm/node_modules/core-js/client/core.min.js"></script>
    <script nomodule="" src="/external/npm/node_modules/systemjs/dist/system.js"></script>
    <script type="module" src="/webapp/aoj/js_bundle/index.js"></script>
    <script nomodule="" src="/webapp/aoj/js_bundle_es5/index.js"></script>
    <script src="/external/npm/node_modules/zone.js/dist/zone.min.js"></script>
  </body>

  </html>