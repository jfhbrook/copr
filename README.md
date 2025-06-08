# COPR

This project contains files for managing my COPR repository:

**<https://copr.fedorainfracloud.org/coprs/jfhbrook/joshiverse/packages/>**

Note that, generally speaking, this project only manages builds for packages I don't own. Individual projects have their own files for configuring builds in COPR.

## `make srpm` builds

Some of these projects - such as `yq` - use COPR's `make srpm` builds.

These builds use [the Makefile in the `.copr` folder](./.copr/Makefile) as their entry point. I *believe* the only task used is `srpm`.

This `Makefile` is configured to call `./copr/srpm.sh` in the package's directory. Typically, this script will source [`prelude.sh`](./.copr/prelude.sh), which sets some expected environment variables and exposes the tools stored in [`bin`](./.copr/bin).

Of particular interest will be the `download-sources` script, which downloads
source files based on the `Source[0-9]` entries in a `.spec.in` file.

## Templates

The [templates directory](./templates) contains some cookiecutter templates!
Try running `just new {{ name }}` to generate a new package.

Note that there isn't a template for tito projects, since those are going to
be pretty custom. Consider copy-pasting out of `korbenware` or `coprctl`.

## License

These files and scripts are licensed MIT/X11. See [`LICENSE`](./LICENSE) for details.
