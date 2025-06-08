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

The [templates directory](./templates) contains some cookiecutter templates! Try running `just new {{ name }}` to generate a new package.

Note that there isn't a template for tito projects, since those are going to be pretty custom. Consider copy-pasting out of `korbenware` or `coprctl`.

## TODOs

I moved the files over here from the `public` repo, but I haven't attempted any builds.

Most packages should be fine. The ones that would be problematic use `package-scm`. These builds use the prelude script and various build tools.

I have a branch that cleans these up significantly, here:

<https://github.com/jfhbrook/copr/pull/1>

As I get these builds working, I should bring over the refactors I made there.

### Simple SCM Builds

These packages simply use scm to store a custom spec, generated with `pyp2spec`:

- `python-mopidy-iris`
- `python-mopidy-local`
- `python-sdbus`

These should build just fine, as long as the paths used are correct - their only dependency is on the `build-srpm` script. Test these out first.

### More Complex Package

The package I currently have active with a more complex build is `yq`. It additionally uses these scripts:

- `set-gh-release-version`
- `download-sources`

### Broken Anyway

These have always been broken:

- `starship`
- `viu`

I *believe* the issue with these is that I'm downloading architecture-specific artifacts, but that I'm not currectly specifying an architecture-specific build. More research will be needed here.

## License

These files and scripts are licensed MIT/X11. See [`LICENSE`](./LICENSE) for details.
