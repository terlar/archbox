server {
    listen  80;
    server_name ~^(?<subdomain>.*)\.ngrok\.com$;

    location / {
      proxy_set_header Host $subdomain.dev;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_redirect off;
      proxy_pass http://localhost:20559;
    }
}
