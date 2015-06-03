-module('provider_deploy').
-behaviour(provider).

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, 'deploy').
-define(DEPS, [app_discovery, tar]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 deploy"}, % How to use the plugin
            {opts, []},                   % list of options understood by the plugin
            {short_desc, "rebar3 deploy plugin"},
            {desc, "rebar3 deploy plugin"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    %%RebarConfig = rebar_config:consult_file("rebar.config"),
    %%State1 = rebar_state:new(RebarConfig),
    %%Profiles = rebar_state:current_profiles(State1),
    %%io:format("Profiles is: ~p~n", Profiles),
    Options = rebar_state:command_args(State),
    io:format("Options are: ~p~n", Optionss),

    DeployConfigurations = rebar_config:consult_file("deploy.config"),
    io:format("Deploy configurations are:  ~p~n", [DeployConfigurations]),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).
