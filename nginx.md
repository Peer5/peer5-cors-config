location / {
    add_header 'Access-Control-Allow-Origin' '*' always;
    add_header 'Access-Control-Allow-Methods' 'GET, HEAD, OPTIONS' always;
    if ($request_method = 'OPTIONS') {
        add_header 'Access-Control-Allow-Headers' 'Range' always;
        add_header 'Content-Length' 0;
        return 204;
    }
    if ($request_method = 'GET') {
        add_header 'Access-Control-Expose-Headers' 'Content-Length' always;
        return 200;
    }
}
