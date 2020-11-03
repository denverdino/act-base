# act-base

Base image for local development for Github Actions. The following packages are installed: 

* Docker CE

# Usage

Using custom runner image for [act](https://github.com/nektos/act)

```
act -P ubuntu-latest=denverdino/act-base --secret-file my.secrets
```
