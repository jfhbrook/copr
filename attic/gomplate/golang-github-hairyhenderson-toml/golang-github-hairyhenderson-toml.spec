# Generated by go2rpm 1.15.0
%bcond check 1
%bcond bootstrap 0

%if %{with bootstrap}
%global debug_package %{nil}
%endif

%if %{with bootstrap}
%global __requires_exclude %{?__requires_exclude:%{__requires_exclude}|}^golang\\(.*\\)$
%endif

# https://github.com/hairyhenderson/toml
%global goipath         github.com/hairyhenderson/toml
Version:                0.4.1

# REMOVE BEFORE SUBMITTING THIS FOR REVIEW
# ---
# New Fedora packages should use %%gometa -f, which makes the package
# ExclusiveArch to %%golang_arches_future and thus excludes the package from
# %%ix86. If the new package is needed as a dependency for another package,
# please consider removing that package from %%ix86 in the same way, instead of
# building more go packages for i686. If your package is not a leaf package,
# you'll need to coordinate the removal of the package's dependents first.
# ---
# REMOVE BEFORE SUBMITTING THIS FOR REVIEW
%gometa -L -f

%global common_description %{expand:
TOML parser for Golang with reflection.}

%global golicenses      COPYING cmd/toml-test-decoder/COPYING cmd/toml-test-\\\
                        encoder/COPYING cmd/tomlv/COPYING
%global godocs          _examples README.md cmd/toml-test-decoder/README.md\\\
                        cmd/toml-test-encoder/README.md cmd/tomlv/README.md

Name:           golang-github-hairyhenderson-toml
Release:        %autorelease
Summary:        TOML parser for Golang with reflection

License:        MIT
URL:            %{gourl}
Source:         %{gosource}

%description %{common_description}

%gopkg

%prep
%goprep -A
%autopatch -p1

%if %{without bootstrap}
%generate_buildrequires
%go_generate_buildrequires
%endif

%if %{without bootstrap}
%build
for cmd in cmd/* ; do
  %gobuild -o %{gobuilddir}/bin/$(basename $cmd) %{goipath}/$cmd
done
%endif

%install
%gopkginstall
%if %{without bootstrap}
install -m 0755 -vd                     %{buildroot}%{_bindir}
install -m 0755 -vp %{gobuilddir}/bin/* %{buildroot}%{_bindir}/
%endif

%if %{without bootstrap}
%if %{with check}
%check
%gocheck
%endif
%endif

%if %{without bootstrap}
%files
%license COPYING cmd/toml-test-decoder/COPYING cmd/toml-test-encoder/COPYING
%license cmd/tomlv/COPYING
%doc _examples README.md cmd/toml-test-decoder/README.md
%doc cmd/toml-test-encoder/README.md cmd/tomlv/README.md
# REMOVE BEFORE SUBMITTING THIS FOR REVIEW
# ---
# New Fedora packages should not use globs to avoid installing conflicting
# binaries.
# Write a _bindir line per each of the binaries the package will install.
# ---
# REMOVE BEFORE SUBMITTING THIS FOR REVIEW
%{_bindir}/*
%endif

%gopkgfiles

%changelog
%autochangelog
