<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Data Laboratory</title>
    <base href="/" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="//fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link rel="icon" type="image/x-icon" href="favicon.ico" />
    <link rel="stylesheet" href="${distRoot}/styles.css" />
  </head>

  <body>
    <app-root></app-root>
    <script type="text/javascript" src="${distRoot}/runtime.js"></script>
    <script type="text/javascript" src="${distRoot}/polyfills.js"></script>
    <c:choose>
      <c:when test="${production}"> </c:when>
      <c:otherwise>
        <script type="text/javascript" src="${distRoot}/styles.js"></script>
        <script type="text/javascript" src="${distRoot}/vendor.js"></script>
      </c:otherwise>
    </c:choose>
    <script type="text/javascript" src="${distRoot}/main.js"></script>
  </body>
</html>
