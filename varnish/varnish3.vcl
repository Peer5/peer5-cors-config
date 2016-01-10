sub vcl_recv {

    # break early for OPTIONS requests
    if (req.request == "OPTIONS") {
        error 204 "No Content";
    }
}

sub vcl_deliver {

    # allow access from any domain (this can be replaced with your website's domain for increased security)
    set resp.http.Access-Control-Allow-Origin = "*";

    if (req.request == "OPTIONS") {

        # tell the client to cache this response
        set resp.http.Access-Control-Max-Age = "1728000";

        # allow client to ur GET/HEAD/OPTIONS requests
        set resp.http.Access-Control-Allow-Methods = "GET, HEAD, OPTIONS";

        # allow the client to set a request header of "Range" to enable range requests
        set resp.http.Access-Control-Allow-Headers = "Range";

        # default OPTIONS response headers & status
        set resp.http.Content-Length = "0";
        set resp.http.Content-Type = "text/plain charset=UTF-8";
    }

    if (req.request == "HEAD") {

        # tell the browser that the following headers can be accessed from JS
        set resp.http.Access-Control-Expose-Headers = "Content-Length";
    }

    if (req.request == "GET") {

        # tell the browser that the following headers can be accessed from JS
        set resp.http.Access-Control-Expose-Headers = "Content-Length, Content-Range";
    }
}