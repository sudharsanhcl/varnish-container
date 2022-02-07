vcl 4.0;
backend default {
        .host = "127.0.0.1";
        .port = "80";
}

sub vcl_recv {
                return(synth(301,  "Page moved"));
}

sub vcl_synth {
         if (resp.status == 301) {
             set resp.http.Location = "https://scin-ui-scin-dev.apps.ocp-dc8-03.ikeadt.com";
             return (deliver);
         }
}
