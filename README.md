provider_deploy
=====

rebar3 deploy plugin

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        { provider_deploy, ".*", {git, "git@host:user/provider_deploy.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 provider_deploy
    ===> Fetching provider_deploy
    ===> Compiling provider_deploy
    <Plugin Output>
