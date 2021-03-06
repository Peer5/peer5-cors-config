vcl 4.0;

sub vcl_recv {

    # break early for OPTIONS requests
    if (req.method == "OPTIONS") {
        return (synth(204, "No Content"));
    }
}

sub vcl_synth {
    if (req.method == "OPTIONS") {

        # allow access from any domain (this can be replaced with your website's domain for increased security)
        set resp.http.Access-Control-Allow-Origin = "*";

        # tell the client to cache this response
        set resp.http.Access-Control-Max-Age = "1728000";

        # allow client to do GET/HEAD/OPTIONS requests
        set resp.http.Access-Control-Allow-Methods = "GET, HEAD, OPTIONS";

        # allow the client to set a request header of "Range" to enable range requests
        set resp.http.Access-Control-Allow-Headers = "Range";

        # default OPTIONS response headers & status
        set resp.http.Content-Length = "0";
        set resp.http.Content-Type = "text/plain charset=UTF-8";
    }
}

sub vcl_deliver {

    # allow access from any domain (this can be replaced with your website's domain for increased security)
    set resp.http.Access-Control-Allow-Origin = "*";

    if (req.method == "HEAD") {

        # tell the browser that the following headers can be accessed from JS
        set resp.http.Access-Control-Expose-Headers = "Content-Length";
    }

    if (req.method == "GET") {

        # tell the browser that the following headers can be accessed from JS
        set resp.http.Access-Control-Expose-Headers = "Content-Length, Content-Range";
    }
}