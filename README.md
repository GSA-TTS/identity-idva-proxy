# IDVA Outbound Proxy
Outbound HTTP proxy for IDVA applications on Cloud.gov

## Why this project
The IDVA project is composed of many different microservices, with many needing to access
known URLs on the public internet. In order to enhance our security and enforce that applications
are not talking to domains other than those we explicitly allow, we use a forward proxy with
an allow list that specify which domains are allowed for our apps.

## Implementation
The IDVA outbound proxy is implemented using the [Caddy v2 Proxy](https://caddyserver.com/v2)
with the [http.forwardproxy plugin](https://github.com/caddyserver/forwardproxy/tree/caddy2)
enabled. The Caddyfile is set up to allow all domains included in a user-provided file named
`allow.acl` over port 443

## Generating the allow.acl
The `Caddyfile` requires a file named `allow.acl` to determine which domains should be allowed
by the proxy. The format of this file is simply one domain per line. For example, the following
allow.acl would allow a client using the proxy to only google and github domains:
```
google.com
github.com
```

### Adding a new domain to the allow list
A new domain can be added by including the domain in the `allow.acl` file that is specified by
the Caddyfile.

### Using a port other than 443
In order to use a port other than 443 when connecting to a domain, update the Caddyfile `ports`
section to include the desired port.

## CI/CD Workflows with GitHub Actions
The most up-to-date information about the CI/CD flows for this repo can be found in the
[GitHub workflows directory](https://github.com/18F/identity-idva-proxy/tree/main/.github/workflows)

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in
[CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright
and related rights in the work worldwide are waived through the
[CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication.
By submitting a pull request, you are agreeing to comply with this waiver of
copyright interest.
