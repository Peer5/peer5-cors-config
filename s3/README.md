# Configuring S3 CORS

When requesting resources from within Javascript the browser applies a security scheme called [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS).
To allow requesting specific ranges of a video file from Javascript several configurations needs to be updated to allow the `Range` header and exposing the content length in the response.

## CORS Configuration tab
First You'll need to go to your **CORS configuration** tab under **Permissions**

![Bucket Permissions Tab](./s3/aws1.png)

## Updating CORS rules

The CORS headers needs to be updated to support [preflight](https://developer.mozilla.org/en-US/docs/Glossary/Preflight_request) requests and expose `Content-Range` and `Content-Length`

Example configuration:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <MaxAgeSeconds>3600</MaxAgeSeconds>
    <ExposeHeader>content-length</ExposeHeader>
    <ExposeHeader>content-range</ExposeHeader>
    <AllowedHeader>*</AllowedHeader>
  </CORSRule>
</CORSConfiguration>
```

![Bucket Permissions Tab](./s3/aws2.png)
