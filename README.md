Running
```
nix-shell -A banditSelection
```

allows to use the following command-line tools:


* ocs The scheduling simulator used in the experiments. Use
`ocs --help` to see all available options.

* ocs-sampler The workload resampler used in the experiments. Use
`ocs-sampler --help` for usage.

* zymake The zymake tool.
The workflow can be executed in the current environment in parallel
via `zymake -l localhost zymakefile`
