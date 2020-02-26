<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title>Angular on Java</title>
  <link rel="icon" type="image/x-icon" href="/favicon.png" />
  <base href="/" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
  <link rel="stylesheet" href="/dist/styles.css" />
  <link rel="stylesheet" href="/external/@angular/material/prebuilt-themes/deeppurple-amber.css" />
</head>

<body>
  <app-component></app-component>
  <script nomodule="" src="/external/core-js/client/core.min.js"></script>
  <script nomodule="" src="/external/systemjs/dist/system.js"></script>
  <script type="module" src="/dist/js_bundle.js"></script>
  <script src="/external/zone.js/dist/zone.min.js"></script>
</body>

</html>